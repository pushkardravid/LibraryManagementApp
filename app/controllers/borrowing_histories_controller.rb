class BorrowingHistoriesController < ApplicationController
  before_action :set_borrowing_history, only: [:show, :edit, :update, :destroy]

  # GET /borrowing_histories
  # GET /borrowing_histories.json
  def index
    @borrowing_histories = BorrowingHistory.all
  end

  # GET /borrowing_histories/1
  # GET /borrowing_histories/1.json
  def show
  end

  # GET /borrowing_histories/new
  def new
    @borrowing_history = BorrowingHistory.new
  end

  # GET /borrowing_histories/1/edit
  def edit
  end

  # POST /borrowing_histories
  # POST /borrowing_histories.json
  def create
    @borrowing_history = BorrowingHistory.new(borrowing_history_params)

    respond_to do |format|
      if @borrowing_history.save
        format.html { redirect_to @borrowing_history, notice: 'Borrowing history was successfully created.' }
        format.json { render :show, status: :created, location: @borrowing_history }
      else
        format.html { render :new }
        format.json { render json: @borrowing_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrowing_histories/1
  # PATCH/PUT /borrowing_histories/1.json
  def update
    respond_to do |format|
      if @borrowing_history.update(borrowing_history_params)
        format.html { redirect_to @borrowing_history, notice: 'Borrowing history was successfully updated.' }
        format.json { render :show, status: :ok, location: @borrowing_history }
      else
        format.html { render :edit }
        format.json { render json: @borrowing_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrowing_histories/1
  # DELETE /borrowing_histories/1.json
  def destroy
    @borrowing_history.destroy
    respond_to do |format|
      format.html { redirect_to borrowing_histories_url, notice: 'Borrowing history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrowing_history
      @borrowing_history = BorrowingHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borrowing_history_params
      params.require(:borrowing_history).permit(:student_id, :book_id, :active, :issue_date)
    end
end
