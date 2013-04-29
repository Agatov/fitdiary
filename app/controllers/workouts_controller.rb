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
    @workout = current_user.workouts.create(params[:workout])
  end

  # PUT /workouts/1
  def update
  end


  # DELETE /workouts/1
  def destroy
    @workout.destroy
    render json: {status: :ok}
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