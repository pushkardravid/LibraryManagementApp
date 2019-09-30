class BookHoldRequest < ApplicationRecord
  belongs_to :student
  belongs_to :book
  belongs_to :library

  enum reason: [:special, :unavailable, :max_reached]

  def self.is_requested?(student_id, book_id)
    if BookHoldRequest.where(:student_id => student_id, :book_id => book_id).length != 0
      true
    else
      false
    end
  end
end
