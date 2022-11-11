class DashboardsController < ApplicationController
  def index
    @weights = Weight.all
    @body_fats = BodyFat.all
    @vitamins = Vitamin.all
    @goals = Goal.all
  end
end
