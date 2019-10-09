class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :university
  enum educational_level: [:undergraduate, :graduate, :phd]
  
  has_many :student_bookmarks, dependent: :destroy    
  has_many :borrowing_histories, dependent: :destroy    
  has_many :book_hold_requests, dependent: :destroy   
   
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true


  def self.calculate_overdue_fine(student_id) 
    overdue_fine = 0 
    checkout_books = BorrowingHistory.fetch_all_active_books_by_student(student_id)

    checkout_books.map { |checkout_book|
      library_id = BookLibraryMapping.fetch_library_for_book(checkout_books.book_id)

      if not library_id.nil?
        library = Library.find(library_id)
        max_days_blocking = library.max_days_blocking 
        overdue_fine += ((Date.today - checkout_book.issue_date).abs + 1) * library.overdue_fines
      end
    }

    overdue_fine
  end
  
end
