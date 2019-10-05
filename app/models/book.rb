class Book < ApplicationRecord

    has_many :book_library_mappings, dependent: :destroy    
    has_many :book_author_mappings, dependent: :destroy
    has_many :book_hold_requests, dependent: :destroy
    has_many :borrowing_histories, dependent: :destroy
    has_many :student_bookmarks, dependent: :destroy
    has_many :book_library_mappings, dependent: :destroy
    

    def self.search(by, search)
        where('title LIKE ?', "%#{search}%")
    end

    def self.fetch_books_by_university(student_id)
        books = Array.new
        Library.where('university_id = ?', Student.find(student_id).university_id).each { |library| 
            BookLibraryMapping.where('library_id = ?', library.id).each { |book_library|
              books.push(Book.find(book_library.book_id))
            }
        }
        books
    end
end
