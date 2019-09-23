require "application_system_test_case"

class BorrowingHistoriesTest < ApplicationSystemTestCase
  setup do
    @borrowing_history = borrowing_histories(:one)
  end

  test "visiting the index" do
    visit borrowing_histories_url
    assert_selector "h1", text: "Borrowing Histories"
  end

  test "creating a Borrowing history" do
    visit borrowing_histories_url
    click_on "New Borrowing History"

    check "Active" if @borrowing_history.active
    fill_in "Book", with: @borrowing_history.book_id
    fill_in "Issue date", with: @borrowing_history.issue_date
    fill_in "Student", with: @borrowing_history.student_id
    click_on "Create Borrowing history"

    assert_text "Borrowing history was successfully created"
    click_on "Back"
  end

  test "updating a Borrowing history" do
    visit borrowing_histories_url
    click_on "Edit", match: :first

    check "Active" if @borrowing_history.active
    fill_in "Book", with: @borrowing_history.book_id
    fill_in "Issue date", with: @borrowing_history.issue_date
    fill_in "Student", with: @borrowing_history.student_id
    click_on "Update Borrowing history"

    assert_text "Borrowing history was successfully updated"
    click_on "Back"
  end

  test "destroying a Borrowing history" do
    visit borrowing_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Borrowing history was successfully destroyed"
  end
end
