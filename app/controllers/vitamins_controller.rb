class VitaminsController < ApplicationController
  def index
    @vitamins = Vitamin.all.order(date: :asc)
    @vitamin = Vitamin.new
  end

  def new
    @vitamin = Vitamin.new
  end

  def create
    @vitamin = Vitamin.new(vitamin_params)
    @vitamin.user = current_user
    @vitamin.date = Date.today
    if @vitamin.save
      redirect_to vitamins_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_vitamins
    @vitamin = Vitamin.new
    @vitamins = Vitamin.where(user: current_user)
  end

  
  private

  def set_vitamin
    @vitamin = Vitamin.find(params[:id])
  end

  def vitamin_params
    params.require(:vitamin).permit(:user, :date)
  end
end
