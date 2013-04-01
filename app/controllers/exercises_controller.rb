class ExercisesController < ApplicationController

  before_filter :find_exercise, only: [:show, :edit, :update, :destroy]
  before_filter :find_workout, only: :create

  def index
  end

  def show
    @exercise = Exercise.find(params[:id])
    respond_to do |format|
      format.json {
        render_for_api :full, json: @exercise
      }
    end
  end

  def new
  end

  def create

    @gymnastic = Gymnastic.create(name: params[:gymnastic_name])
    @exercise = @workout.exercises.create(gymnastic: @gymnastic)

    params[:exercise_sets].each do |exercise_set_params|
      @exercise.add_set(exercise_set_params[:weight], exercise_set_params[:repeats])
    end

    respond_to do |format|
      format.json {
        render_for_api :full, json: @exercise
      }
    end

  end

  def edit
  end

  def update
    if @exercise.update_attributes(params[:exercise])
      redirect_to root_path
    else
      render :edit
    end
  end

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