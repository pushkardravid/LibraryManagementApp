json.extract! book_hold_request, :id, :student_id, :book_id, :library_id, :reason, :created_at, :updated_at
json.url book_hold_request_url(book_hold_request, format: :json)
