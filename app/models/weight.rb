class Weight < ApplicationRecord
  belongs_to :user

  validates :value, presence: true, numericality: true
  validates :date, uniqueness: true, presence: true
end
