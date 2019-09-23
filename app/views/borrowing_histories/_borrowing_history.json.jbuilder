json.extract! borrowing_history, :id, :student_id, :book_id, :active, :issue_date, :created_at, :updated_at
json.url borrowing_history_url(borrowing_history, format: :json)
