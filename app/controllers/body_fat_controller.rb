class BodyFatController < ApplicationController
  def index
    @body_fats = BodyFat.all
  end
end
