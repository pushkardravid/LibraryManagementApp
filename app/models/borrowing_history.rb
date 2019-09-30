class BorrowingHistory < ApplicationRecord
  belongs_to :student
  belongs_to :book

  def self.is_book_active?(student_id, book_id)
    book = where('student_id = :student_id AND book_id = :book_id', student_id: "#{student_id}", book_id: "#{book_id}").first
    if !book.nil?
      book.active
    else
      false
    end
  end

  def self.fetch_specific_active_book(student_id, book_id)
    where('student_id = :student_id AND book_id = :book_id AND active = :active', student_id: "#{student_id}", book_id: "#{book_id}", active: "#{true}").first
  end

  def self.fetch_all_active_books_by_student(student_id)
    where('student_id = :student_id AND active = :active', student_id: "#{student_id}", active: "#{true}")
  end
end
