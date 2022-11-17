class VitaminsController < ApplicationController
  def index
    @vitamins = Vitamin.where(user: current_user).order(date: :desc)
    @vitamin = Vitamin.new
  end

  def new
    @vitamin = Vitamin.new
  end

  def create
    @vitamin = Vitamin.new
    @vitamin.date = Date.today
    @vitamin.user = current_user
    # @vitamin.record = set_record
    if @vitamin.save
      redirect_to vitamins_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  #   @vitamin = Vitamin.last
  #       if @vitamin.update(:record)
  #         redirect_to vitamins_path
  #       else
  #         render :edit, status: :unprocessable_entity
  #       end
  #   end
  # end

  private

  def set_vitamin
    @vitamin = Vitamin.find(params[:id])
  end

  def vitamin_params
    params.require(:vitamin).permit(:user, :date)
  end
end
