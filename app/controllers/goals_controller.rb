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

  def edit
  end

  def update
    if goal.update(goal_params)
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path, status: :see_other
  end

  private

  # def goal_params
  #   params.require(:goal).permit(:description, :status, :user)
  # end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
