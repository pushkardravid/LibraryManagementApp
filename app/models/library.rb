class Library < ApplicationRecord
    belongs_to :university
    has_many :book_library_mappings, dependent: :destroy    
    has_many :book_hold_requests, dependent: :destroy    
    has_many :librarians, dependent: :destroy    

    def self.get_overdue_books(library_id)
        overdue_books = Array.new
        checkout_books = BorrowingHistory.all.select { |bh|
            library_id == BookLibraryMapping.fetch_library_for_book(bh.book_id)
        }

        checkout_books.map { |checkout_book|
            if(checkout_book.issue_date < Date.today)
                overdue_books.push(checkout_book)
            end
        }
        overdue_books
      end

end
