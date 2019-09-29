class Book < ApplicationRecord
    
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
