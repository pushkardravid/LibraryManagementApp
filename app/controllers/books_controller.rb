class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :bookmark]
  before_action :test_user

	def test_user
		if not (admin_signed_in? or student_signed_in?)
			redirect_to('/students/sign_in')
		end
  end
  
  # GET /books
  # GET /books.json
  def index
    if current_student
      student_id = current_student.id 
      @books = Book.fetch_books_by_university(student_id)
    elsif current_admin
      @books = Book.all
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  def search
    if params[:search].nil?
      redirect_to books_url, alert: 'Search criteria cannot be empty.'
    else 
      @search_results = Book.search(params["search_by"].downcase, params[:search])
    end
  end

  def view_bookmarks
    if current_student
      student_id = current_student.id
      @books_with_bookmarks = Book.where('id = ?', StudentBookmark.where(:student_id => student_id).book_id)

    else
      @books_with_bookmarks = Book.where('id = ?', StudentBookmark.all.book_id)
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
    #render :nothing => true
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new
    @book.isbn = params[:book][:isbn]
    @book.title = params[:book][:title]
    @book.language = params[:book][:language]
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
        format.json { render json: @book.errors + @book_library_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
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
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :title, :language, :published, :edition, :image, :subject, :summary, :special)
      params.require(:library)
      params.require(:quantity)
    end

end
