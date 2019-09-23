class BookHoldRequest < ApplicationRecord
  belongs_to :student
  belongs_to :book
  belongs_to :library
end
