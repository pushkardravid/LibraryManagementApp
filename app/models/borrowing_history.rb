class BorrowingHistory < ApplicationRecord
  belongs_to :student
  belongs_to :book

  def self.is_book_active?(book_id)
    book = self.find_by book_id: book_id
    if !book.nil?
      book.active
    else
      false
    end
  end
end
