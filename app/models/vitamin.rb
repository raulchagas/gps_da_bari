class Vitamin < ApplicationRecord
  belongs_to :user
end

def length
  consecutive_days
end

  # private

def days
  @days = @vitamins.order("created_at DESC").pluck(:created_at).map(&:to_date).uniq
  # @days = @vitamins.order("created_at DESC").pluck(:date).uniq
end

def consecutive_days
  streak = first_day_is_today? ? 1 : 0
  days.each_with_index do |day, index|
    break unless first_day_is_today?

    if days[index + 1] == day.yesterday
      streak += 1
    else
      break
    end
  end
  streak
end

def first_day_is_today?
  days.first == Date.current
end
