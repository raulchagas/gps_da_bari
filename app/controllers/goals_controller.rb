class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update destroy]
  def index
    @goals = Goal.all
  end

  def show
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to goals_path
    else
      redender :new, status: :unprocessable_entity
    end
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

  def goal_params
    params.require(:goal).permit(:description, :status, :user)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
