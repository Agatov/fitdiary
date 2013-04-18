class SetsController < ApplicationController

  respond_to :json

  before_filter :find_exercise, only: :create
  before_filter :find_set, only: [:show, :update, :destroy]


  # GET /sets/1
  def show
  end

  # POST /exercises/1/sets
  def create
    @set = ExerciseSet.create(params[:set])
    @exercise.exercise_sets << @set
  end


  # PUT /sets/1
  def update
    @set.update_attributes(params[:set])
  end

  # DELETE /sets/1
  def destroy
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