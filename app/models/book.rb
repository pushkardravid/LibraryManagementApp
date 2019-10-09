class Book < ApplicationRecord
    require 'carrierwave/orm/activerecord'
    mount_uploader :image, AvatarUploader

    has_many :book_library_mappings, dependent: :destroy    
    has_many :book_author_mappings, dependent: :destroy
    has_many :book_hold_requests, dependent: :destroy
    has_many :borrowing_histories, dependent: :destroy
    has_many :student_bookmarks, dependent: :destroy
    has_many :book_library_mappings, dependent: :destroy
    
    validates :isbn, presence: true, uniqueness: true
    validates :title, presence: true
    

    def self.search(by, search)
        if by.downcase == "title"
            where('title LIKE ?', "%#{search}%")
        elsif by.downcase == "author"
            where('author LIKE ?', "%#{search}%")
        elsif by.downcase == "subject"
            where('subject LIKE ?', "%#{search}%")
        elsif by.downcase == "publication year"
            where('published LIKE ?', "%#{search}%")
        else
            Book.all
        end
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

    def self.fetch_books_by_ids(ids)         
        ids.map {|id| Book.find(id)}
    end

    def self.fetch_books_by_library(library_id)         
        books = Array.new
        BookLibraryMapping.where('library_id = ?', library_id).each { |book_library|
              books.push(Book.find(book_library.book_id))
            }
        books
    end
end
