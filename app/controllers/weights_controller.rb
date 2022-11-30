class WeightsController < ApplicationController
  def index
    @weights = Weight.where(user: current_user).order(created_at: :asc)
    @weight = Weight.new
  end

  def new
    @weight = Weight.new
  end

  def create
    @weight = Weight.new(weight_params)
    @weight.user = current_user
    @weight.date = Date.today
    if @weight.save
      redirect_to weights_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @weight = Weight.find(params[:id])
  end

  private

  def weight_params
    params.require(:weight).permit(:user, :value, :date)
  end
end
