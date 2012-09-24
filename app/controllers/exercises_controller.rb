class ExercisesController < ApplicationController

  before_filter :find_exercise, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    respond_to do |format|
      format.json {
        render_for_api :full, json: @exercise, meta: {status: :ok}
      }
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    respond_to do |format|
      if @exercise.update_attributes(params[:exercise])
        format.html {
          redirect_to root_path
        }

        format.json {
          render json: {status: :ok}
        }
        
      else
        format.html {
          render :edit
        }

        format.json {
          rnder json: {status: :error}
        }
      end
    end
  end

  def destroy
  end

  private

  def find_exercise
    @exercise = Exercise.find(params[:id], include: [:gymnastic, :exercise_sets])
  end
end