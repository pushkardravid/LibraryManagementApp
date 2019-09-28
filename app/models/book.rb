class Book < ApplicationRecord
    def self.search(by, search)
        where('title LIKE ?', "%#{search}%")
    end
end
