class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
  belongs_to :university
  enum educational_level: [:undergraduate, :graduate, :phd]
  
  has_many :student_bookmarks, dependent: :destroy    
  has_many :borrowing_histories, dependent: :destroy    
  has_many :book_hold_requests, dependent: :destroy    

  def self.new_with_session(params, session)
    super.tap do |student|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        student.email = data["email"] if student.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |student|
    student.email = auth.info.email
    student.password = Devise.friendly_token[0, 20]
    student.name = auth.info.name   # assuming the student model has a name
    student.university_id = 1
    #student.degree_to_book_mappings_id = 1
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # student.skip_confirmation!
  end
end

  has_many :book_hold_requests, dependent: :destroy   
   
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
