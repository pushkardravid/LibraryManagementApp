class BookLibraryMapping < ApplicationRecord
  belongs_to :book
  belongs_to :library
end
