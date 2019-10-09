class BorrowingHistory < ApplicationRecord
  belongs_to :student
  belongs_to :book
  validates :issue_date, presence: true
  validates :active, presence: true

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

  def self.fetch_borrowed_books_by_student(student_id)
    where('student_id = :student_id', student_id: "#{student_id}")
  end

  def self.fetch_all_active_books_in_library(librarian_library_id)
    where('active = :active', active: "#{true}").select { |bh|  
      librarian_library_id == BookLibraryMapping.fetch_library_for_book(bh.book_id) 
    }
  end

  def self.fetch_all_books_in_library(librarian_library_id)
    BorrowingHistory.all.select { |bh|  
      librarian_library_id == BookLibraryMapping.fetch_library_for_book(bh.book_id) 
    }
  end

  def self.fetch_borrowed_books_by_library(library_id)
    where('library_id = :library_id', library_id: "#{library_id}")
  end
end
