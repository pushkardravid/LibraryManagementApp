class University < ApplicationRecord
    has_many :libraries, dependent: :destroy    
    has_many :students, dependent: :destroy    

end
