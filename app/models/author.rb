class Author < ApplicationRecord
    
    has_many :book_author_mappings, dependent: :destroy    

end
