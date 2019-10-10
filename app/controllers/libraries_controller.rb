class LibrariesController < ApplicationController
  before_action :set_library, only: [:show, :edit, :update, :destroy]
  before_action :test_user

  def test_user
		if not (admin_signed_in? or  librarian_signed_in?)
			redirect_to('/')
    end
  end

  # GET /libraries
  # GET /libraries.json
  def index
    if current_admin
      @libraries = Library.all
    elsif current_librarian
      library_id = current_librarian.library_id
      @libraries = Array.new.push(Library.find(library_id))
    elsif current_student
      @libraries = Library.fetch_libraries_by_university(current_student.university_id)
    end
  end

  # GET /libraries/1
  # GET /libraries/1.json
  def show
  end

  # GET /libraries/new
  def new
    @library = Library.new
  end

  # GET /libraries/1/edit
  def edit
  end

  # POST /libraries
  # POST /libraries.json
  def create
    @library = Library.new(library_params)

    respond_to do |format|
      if @library.save
        format.html { redirect_to @library, notice: 'Library was successfully created.' }
        format.json { render :show, status: :created, location: @library }
      else
        format.html { render :new }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraries/1
  # PATCH/PUT /libraries/1.json
  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to @library, notice: 'Library was successfully updated.' }
        format.json { render :show, status: :ok, location: @library }
      else
        format.html { render :edit }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1
  # DELETE /libraries/1.json
  def destroy
    @library.destroy
    respond_to do |format|
      format.html { redirect_to libraries_url, notice: 'Library was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def overdue_books
    @library = Library.find(current_librarian.library_id)
    @overdue_books = Library.get_overdue_books(@library.id)
    @overdue_books
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def library_params
      params.require(:library).permit(:name, :location, :max_days_blocking, :overdue_fines, :university_id)
    end
end
