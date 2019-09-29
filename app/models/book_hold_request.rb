class BookHoldRequest < ApplicationRecord
  belongs_to :student
  belongs_to :book
  belongs_to :library

  enum reason: [:special, :unavailable, :max_reached]
end
