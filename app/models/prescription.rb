class Prescription < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :title, presence: true
  validates :title, uniqueness: true
end
