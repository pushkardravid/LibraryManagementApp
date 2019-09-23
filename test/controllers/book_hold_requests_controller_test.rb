require 'test_helper'

class BookHoldRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_hold_request = book_hold_requests(:one)
  end

  test "should get index" do
    get book_hold_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_book_hold_request_url
    assert_response :success
  end

  test "should create book_hold_request" do
    assert_difference('BookHoldRequest.count') do
      post book_hold_requests_url, params: { book_hold_request: { book_id: @book_hold_request.book_id, library_id: @book_hold_request.library_id, reason: @book_hold_request.reason, student_id: @book_hold_request.student_id } }
    end

    assert_redirected_to book_hold_request_url(BookHoldRequest.last)
  end

  test "should show book_hold_request" do
    get book_hold_request_url(@book_hold_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_hold_request_url(@book_hold_request)
    assert_response :success
  end

  test "should update book_hold_request" do
    patch book_hold_request_url(@book_hold_request), params: { book_hold_request: { book_id: @book_hold_request.book_id, library_id: @book_hold_request.library_id, reason: @book_hold_request.reason, student_id: @book_hold_request.student_id } }
    assert_redirected_to book_hold_request_url(@book_hold_request)
  end

  test "should destroy book_hold_request" do
    assert_difference('BookHoldRequest.count', -1) do
      delete book_hold_request_url(@book_hold_request)
    end

    assert_redirected_to book_hold_requests_url
  end
end
