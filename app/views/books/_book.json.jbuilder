json.extract! book, :id, :isbn, :title, :language, :published, :edition, :image, :subject, :summary, :special, :created_at, :updated_at
json.url book_url(book, format: :json)
