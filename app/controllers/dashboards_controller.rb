class DashboardsController < ApplicationController
  def index
    @weights = Weight.where(user: current_user).order(created_at: :asc)
    @body_fats = BodyFat.where(user: current_user).order(date: :desc)
    @vitamins = Vitamin.where(user: current_user).order(date: :desc)
    @goals = Goal.where(user: current_user)
    @done_goals = Goal.where(user: current_user, status: true)
    @open_goals = Goal.where(user: current_user, status: false)
    @user = current_user
  end

end
