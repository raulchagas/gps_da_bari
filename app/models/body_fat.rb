class BodyFat < ApplicationRecord
  belongs_to :user

  validates :value, presence: true, numericallity: true
end
