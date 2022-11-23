class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include Streakable
  has_many :goals, dependent: :destroy
  has_many :body_fat, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :weights, dependent: :destroy
  has_many :body_fats, dependent: :destroy
  has_many :vitamins, dependent: :destroy
  has_one_attached :avatar

  def days
    # @vitamins.order("created_at DESC").pluck(:created_at).map(&:to_date).uniq
    self.vitamins.order(date: :desc).pluck(:date).uniq
  end

  def update_vitamin_streak
    self.vitamin_record = self.vitamin_record.nil? ? 0 : self.vitamin_record
    record = consecutive_days > self.vitamin_record ? consecutive_days : self.vitamin_record
    self.update(vitamin_record: record)
  end


  # private

  def consecutive_days

    return 0 unless days.first == Date.today || days.first == Date.yesterday
    streak = 1
    days.each_with_index do |day, index|
      if days[index + 1] == day.yesterday
        streak += 1
      else
        break
      end
    end
    streak
  end
end
