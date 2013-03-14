class SetsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    find_exercise

    @set = @exercise.exercise_sets.build(params[:set])

    if @set.save
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

  def edit
  end

  def update
    find_set
    if @set.update_attributes(params[:set])
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

  def destroy
    find_set
    @set.destroy
    render json: {status: :ok}
  end

  private

  def find_exercise
    @exercise = Exercise.find(params[:exercise_id])
  end

  def find_set
    @set = ExerciseSet.find(params[:id])
  end
end