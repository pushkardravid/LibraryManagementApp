class BookLibraryMapping < ApplicationRecord
  belongs_to :book
  belongs_to :library

  def self.fetch_book_by_library(library_id)
    where('library_id = ?', "#{library_id}").collect{ |u| u.book_id }
  end

  def self.fetch_library_for_book(book_id)
    book_libraries = self.where('book_id = ?', "#{book_id}")
    if not (book_libraries.nil? and book_libraries.empty?)
      book_libraries.first.library_id
    end
  end

  def self.fetch_book_quantity(book_id)
    book_library = self.find_by book_id: book_id
    if !book_library.nil?
      book_library.quantity
    else
      0
    end
  end

  def self.decrement_quantity(book_id)
    book_library = self.find_by book_id: book_id
    if !book_library.nil?
      book_library.update_attributes(:quantity => book_library.quantity - 1)
    end
  end

  def self.increment_quantity(book_id)
    book_library = self.find_by book_id: book_id
    if !book_library.nil?
      book_library.update_attributes(:quantity => book_library.quantity + 1)
    end
  end
end
