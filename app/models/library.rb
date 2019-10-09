class Library < ApplicationRecord
    belongs_to :university
    has_many :book_library_mappings, dependent: :destroy    
    has_many :book_hold_requests, dependent: :destroy    
    has_many :librarians, dependent: :destroy    

    validates :name, presence: true
    validates :max_days_blocking, presence: true
    validates :overdue_fines, presence: true    
    
end
