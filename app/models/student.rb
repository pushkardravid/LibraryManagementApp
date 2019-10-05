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

end
