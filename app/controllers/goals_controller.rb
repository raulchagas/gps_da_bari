class GoalsController < ApplicationController
  # before_action :set_goal, only: %i[show edit update destroy]
  def index
    @goals = Goal::DEFAULT_GOALS
    @goal = Goal.new
    @user = current_user
  end

  def new
    @goal = Goal.new
  end

  def create
    if params[:goal][:description].present?
      params[:goal][:description].shift
      params[:goal][:description].each do |description|
      # @goal.description = description
      # @goal.user = current_user
      @goal = Goal.create(description: description, user: current_user)
      end
    end
    if @goal.save
      redirect_to my_goals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_goals
    @goals = Goal.where(user: current_user)
  end

  # def edit
  #   @goals = Goal.where(user: current_user)
  #   @goal = Goal.find(params[:id])
  # end

  # def update
  #   if @goal.update(status: true)
  #     redirect_to my_goals_path
  #   else
  #     render :my_goals
  #   end
  # end

  def set_as_done
    @goal = Goal.find(params[:id])
    if @goal.update(status: true)
      redirect_to my_goals_path
    else
      render :my_goals
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to my_goals_path
  end

  private

  # def goal_params
  #   params.require(:goal).permit(:description, :status, :user)
  # end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
