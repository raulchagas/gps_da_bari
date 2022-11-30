class Weight < ApplicationRecord
  belongs_to :user

  validates :value, presence: true, numericality: true
  validates :date, on: :create, uniqueness: { scope: :user_id }
end
