class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goals, dependent: :destroy
  has_many :body_fat, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :weights, dependent: :destroy
  has_many :body_fats, dependent: :destroy
  has_many :vitamins, dependent: :destroy
end
