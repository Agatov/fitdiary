class ExercisesController < ApplicationController

  before_filter :find_exercise, only: [:show, :edit, :update, :destroy]

  def index
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
    if @exercise.update_attributes(params[:exercise])
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_exercise
    @exercise = Exercise.find(params[:id], include: [:gymnastic, :exercise_sets])
  end
end