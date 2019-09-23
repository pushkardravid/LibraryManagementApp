class Student < ApplicationRecord
  belongs_to :university
  enum educational_level: [:undergraduate, :graduate, :phd]
end
