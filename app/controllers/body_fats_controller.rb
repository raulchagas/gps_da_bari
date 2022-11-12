class BodyFatsController < ApplicationController
  def index
    @body_fats = BodyFat.all
  end

  def new
    @body_fat = BodyFat.new
  end

  def create
    @body_fat = BodyFat.new(body_fat_params)
    @body_fat.user = current_user
    if @body_fat.save
      redirect_to body_fats_path
    else
      render :new, status: unprocessable_entity
    end
  end

  private

  def body_fat_params
    params.require(:body_fat).permit(:user, :value)
  end

end
