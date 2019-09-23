require 'test_helper'

class BorrowingHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borrowing_history = borrowing_histories(:one)
  end

  test "should get index" do
    get borrowing_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_borrowing_history_url
    assert_response :success
  end

  test "should create borrowing_history" do
    assert_difference('BorrowingHistory.count') do
      post borrowing_histories_url, params: { borrowing_history: { active: @borrowing_history.active, book_id: @borrowing_history.book_id, issue_date: @borrowing_history.issue_date, student_id: @borrowing_history.student_id } }
    end

    assert_redirected_to borrowing_history_url(BorrowingHistory.last)
  end

  test "should show borrowing_history" do
    get borrowing_history_url(@borrowing_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_borrowing_history_url(@borrowing_history)
    assert_response :success
  end

  test "should update borrowing_history" do
    patch borrowing_history_url(@borrowing_history), params: { borrowing_history: { active: @borrowing_history.active, book_id: @borrowing_history.book_id, issue_date: @borrowing_history.issue_date, student_id: @borrowing_history.student_id } }
    assert_redirected_to borrowing_history_url(@borrowing_history)
  end

  test "should destroy borrowing_history" do
    assert_difference('BorrowingHistory.count', -1) do
      delete borrowing_history_url(@borrowing_history)
    end

    assert_redirected_to borrowing_histories_url
  end
end
