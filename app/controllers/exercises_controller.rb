class ExercisesController < ApplicationController

  respond_to :json

  before_filter :find_exercise, only: [:show, :update, :destroy]
  before_filter :find_workout, only: :create

  # GET /exercises/1
  def show
  end

  # POST /workouts/1/exercises
  # @todo часть кода нужно унести в модель тренировки
  def create
    @exercise = @workout.add_exercise(params[:gymnastic_name])
  end

  # PUT /exercises/1
  def update
    @exercise.gymnastic = Gymnastic.find_or_create_by_name(params[:gymnastic_name])
    @exercise.attributes = params[:exercise]
    @exercise.save
  end

  # DELETE /exercises/1
  def destroy
  end

  private

  def find_workout
    @workout = Workout.find(params[:workout_id])
  end

  def find_exercise
    @exercise = Exercise.find(params[:id], include: [:gymnastic, :exercise_sets])
  end
end