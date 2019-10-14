class BooksController < ApplicationController
  require 'date'
  before_action :set_book, only: [:show, :edit, :update, :destroy, :bookmark_toggle, :checkout_book, :request_book, :return_book]
  before_action :test_user

  def test_user
		if not (admin_signed_in? or student_signed_in? or librarian_signed_in?)
			redirect_to('/')
    end
  end

  # GET /books
  # GET /books.json
  # TODO .paginate(page: params[:page], per_page: 5)
  def index
    if current_student
      student_id = current_student.id 
      @books = Book.fetch_books_by_university(student_id)
    elsif current_admin
      @books = Book.all
    elsif current_librarian
      library_id = current_librarian.library_id
      @books = Book.fetch_books_by_library(library_id)
    end

    if !params[:search].nil?
      @books = @books & Book.search(params["search_by"].downcase, params[:search])
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end
  
  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  # TODO Param Change
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  # TODO Foreign key delete book_library_mappings
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new
    @book.isbn = params[:book][:isbn]
    @book.title = params[:book][:title]
    @book.language = params[:book][:language]
    @book.author = params[:book][:author]
    @book.published = params[:book][:published]
    @book.edition = params[:book][:edition]
    @book.image = params[:book][:image]
    @book.subject = params[:book][:subject]
    @book.summary = params[:book][:summary]
    @book.special = params[:book][:special]
    
    respond_to do |format|
      if @book.save
        @book_library_mapping = BookLibraryMapping.new    
        @book_library_mapping.book_id = @book.id
        @book_library_mapping.quantity = params[:quantity]
        @book_library_mapping.library_id = params[:library]
        @book_library_mapping.save

        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def view_bookmarks
    if current_student
      student_bookmarks =  StudentBookmark.where(:student_id => current_student.id)
      if not student_bookmarks.nil? or student_bookmarks.empty?
        @books_with_bookmarks = Book.fetch_books_by_ids(student_bookmarks.map {|student_bookmark| student_bookmark.book_id })
      end
    end
  end

  
  def view_student_checkouts
    if current_student
      borrowed_bookmarks =  BorrowingHistory.fetch_all_active_books_by_student(current_student.id)
      if not borrowed_bookmarks.nil? or borrowed_bookmarks.empty?
        @borrowed_books = Book.fetch_books_by_ids(borrowed_bookmarks.map {|borrowed_bookmark| borrowed_bookmark.book_id })
      end
    end
  end

  def bookmark_toggle
    student_id = current_student.id 
    if StudentBookmark.where(:book_id => params[:id]).count == 0
      @student_bookmark = StudentBookmark.new

      @student_bookmark.student_id = student_id
      @student_bookmark.book_id = params[:id]

      if @student_bookmark.save
        flash[:notice] =  "Book successfully bookmarked."
      else
        flash[:error] =  "Error occurred while bookmarking requested book."
      end
    else
      StudentBookmark.where(:book_id => params[:id], :student_id => student_id).first.destroy
    end

    redirect_to request.referrer
  end



  def checkout_book
    student_borrowed_books_count = BorrowingHistory.fetch_all_active_books_by_student(current_student.id).count
    student_allowed_count = StaticData::BOOK_SPECIFICATIONS[current_student.educational_level.to_sym]
    
    if student_borrowed_books_count >= student_allowed_count
      flash[:notice] =  "You have already maxed out your allowed checkouts. Creating the hold request for this book."
      return request_book
    end

    checkout_handler(current_student.id)

    redirect_to request.referrer
  end



  def request_book
    
    student_id = current_student.id
    book_id = @book.id

    if BookHoldRequest.where(:student_id => student_id, :book_id => book_id).length != 0
      BookHoldRequest.where(:student_id => student_id, :book_id => book_id).first.destroy
    else

      @book_hold_request = BookHoldRequest.new
      @book_hold_request.student_id = current_student.id
      @book_hold_request.book_id = @book.id
      @book_hold_request.library_id = BookLibraryMapping.fetch_library_for_book(@book.id)

      if @book.special
        @book_hold_request.reason = 0
      elsif BookLibraryMapping.fetch_book_quantity(@book.id) == 0
        @book_hold_request.reason = 1
      else
        @book_hold_request.reason = 2
      end
      
      if @book_hold_request.save
        flash[:notice] =  "Book was successfully requested."
      else
        flash[:error] =  "Error occurred while requesting book."
      end
    end

    redirect_to request.referrer
  end



  def return_book
    @borrowing_history = BorrowingHistory.fetch_specific_active_book(current_student.id, @book.id)
    
    if !@borrowing_history.nil?
      BookLibraryMapping.increment_quantity(@book.id)
      @borrowing_history.update_attributes(:active => false)

      book_hold_requests = BookHoldRequest.fetch_hold_requests_by_book(@book.id)
      if !(book_hold_requests.nil? or book_hold_requests.empty?) and book_hold_requests.first.reason == 1
        checkout_handler(book_hold_requests.first.student_id)
      end
        
      flash[:notice] =  "Book was successfully returned."
    else
      flash[:error] =  "Error occurred while returning the requested book."
    end

    redirect_to request.referrer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :title, :language, :author, :published, :edition, :image, :subject, :summary, :special)
      # params.require(:library)
      # params.require(:quantity)
    end

    def checkout_handler(student_id)
      @borrowing_history = BorrowingHistory.new

      @borrowing_history.student_id = student_id
      @borrowing_history.book_id = @book.id
      @borrowing_history.active = true
      @borrowing_history.issue_date = Date.today

      if @borrowing_history.save
        BookLibraryMapping.decrement_quantity(@book.id)
        flash[:notice] =  "Book was successfully checked out."
      else
        flash[:error] =  "Error occurred in checking out."
      end
      @borrowing_history
    end
end