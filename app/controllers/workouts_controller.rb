class WorkoutsController < ApplicationController

  before_filter :find_workout, only: [:show, :edit, :update, :destroy]
  before_filter :has_access?, only: [:edit, :update, :destroy]

  def index
    @workouts = current_user.workouts
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @workout.destroy
  end

  private

  def find_workout
    @workout = Workout.find(params[:id])
  end

  def has_access?
    unless @workout.user_id == current_user.id
      raise Exception("!!!")
    end
  end
end