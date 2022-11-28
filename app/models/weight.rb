class Weight < ApplicationRecord
  belongs_to :user

  validates :value, presence: true, numericality: true
  validates :date, presence: true
end
