class BodyFat < ApplicationRecord
  belongs_to :user

  validates :value, presence: true, numericality: true
end
