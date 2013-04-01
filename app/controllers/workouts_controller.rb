class WorkoutsController < ApplicationController

  before_filter :find_workout, only: [:show, :edit, :update, :destroy]
  before_filter :has_access?, only: [:edit, :update, :destroy]

  def index
    @workouts = current_user.workouts.includes(:exercises, {exercises: :exercise_sets}, {exercises: :gymnastic}).order("date desc, id desc")

    respond_to do |format|
      format.html { render }
      format.json {
        render_for_api :full, json: @workouts
      }
    end
  end

  def show
  end

  def new
  end

  def create
    @workout = current_user.workouts.create(date: Time.now.strftime('%Y-%m-%d'))

    respond_to do |format|
      format.json {
        render_for_api :full, json: @workout, location: nil
      }
    end
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