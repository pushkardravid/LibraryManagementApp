require "application_system_test_case"

class BookHoldRequestsTest < ApplicationSystemTestCase
  setup do
    @book_hold_request = book_hold_requests(:one)
  end

  test "visiting the index" do
    visit book_hold_requests_url
    assert_selector "h1", text: "Book Hold Requests"
  end

  test "creating a Book hold request" do
    visit book_hold_requests_url
    click_on "New Book Hold Request"

    fill_in "Book", with: @book_hold_request.book_id
    fill_in "Library", with: @book_hold_request.library_id
    fill_in "Reason", with: @book_hold_request.reason
    fill_in "Student", with: @book_hold_request.student_id
    click_on "Create Book hold request"

    assert_text "Book hold request was successfully created"
    click_on "Back"
  end

  test "updating a Book hold request" do
    visit book_hold_requests_url
    click_on "Edit", match: :first

    fill_in "Book", with: @book_hold_request.book_id
    fill_in "Library", with: @book_hold_request.library_id
    fill_in "Reason", with: @book_hold_request.reason
    fill_in "Student", with: @book_hold_request.student_id
    click_on "Update Book hold request"

    assert_text "Book hold request was successfully updated"
    click_on "Back"
  end

  test "destroying a Book hold request" do
    visit book_hold_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book hold request was successfully destroyed"
  end
end
