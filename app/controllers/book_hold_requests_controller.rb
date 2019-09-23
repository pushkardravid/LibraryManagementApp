class BookHoldRequestsController < ApplicationController
  before_action :set_book_hold_request, only: [:show, :edit, :update, :destroy]

  # GET /book_hold_requests
  # GET /book_hold_requests.json
  def index
    @book_hold_requests = BookHoldRequest.all
  end

  # GET /book_hold_requests/1
  # GET /book_hold_requests/1.json
  def show
  end

  # GET /book_hold_requests/new
  def new
    @book_hold_request = BookHoldRequest.new
  end

  # GET /book_hold_requests/1/edit
  def edit
  end

  # POST /book_hold_requests
  # POST /book_hold_requests.json
  def create
    @book_hold_request = BookHoldRequest.new(book_hold_request_params)

    respond_to do |format|
      if @book_hold_request.save
        format.html { redirect_to @book_hold_request, notice: 'Book hold request was successfully created.' }
        format.json { render :show, status: :created, location: @book_hold_request }
      else
        format.html { render :new }
        format.json { render json: @book_hold_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_hold_requests/1
  # PATCH/PUT /book_hold_requests/1.json
  def update
    respond_to do |format|
      if @book_hold_request.update(book_hold_request_params)
        format.html { redirect_to @book_hold_request, notice: 'Book hold request was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_hold_request }
      else
        format.html { render :edit }
        format.json { render json: @book_hold_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_hold_requests/1
  # DELETE /book_hold_requests/1.json
  def destroy
    @book_hold_request.destroy
    respond_to do |format|
      format.html { redirect_to book_hold_requests_url, notice: 'Book hold request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_hold_request
      @book_hold_request = BookHoldRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_hold_request_params
      params.require(:book_hold_request).permit(:student_id, :book_id, :library_id, :reason)
    end
end
