class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :university
  enum educational_level: [:undergraduate, :graduate, :phd]

  def self.get_educational_level(level)
    level_sym = nil
    if level == 0
      level_sym = :undergraduate
    elsif level == 1
      level_sym = :graduate
    elsif level == 2
      level_sym = :phd
    end
    level_sym
  end
end
