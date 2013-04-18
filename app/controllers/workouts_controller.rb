class WorkoutsController < ApplicationController

  respond_to :json

  before_filter :find_workout, only: [:show, :update, :destroy]
  before_filter :has_access?, only: [:update, :destroy]

  # GET /workouts
  def index
    @workouts = current_user.workouts.includes(:exercises, {exercises: :exercise_sets}, {exercises: :gymnastic}).order("date desc, id desc")
  end

  # GET /workouts/1
  def show
  end

  # POST /workouts
  def create
    @workout = current_user.workouts.create(date: Time.now.strftime('%Y-%m-%d'))

    respond_to do |format|
      format.json {
        render_for_api :full, json: @workout, location: nil
      }
    end
  end

  # PUT /workouts/1
  def update
  end


  # DELETE /workouts/1
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