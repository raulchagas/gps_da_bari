class WeightsController < ApplicationController
  def index
    @weights = Weight.all
  end

  def new
    @weight = Weight.new
  end

  def create
    @weight = Weight.new(weight_params)
    @user.weight = current_user
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
    params.require(:weight).permit(:user, :value)
  end

end
