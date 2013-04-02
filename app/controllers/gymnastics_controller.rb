class GymnasticsController < ApplicationController
  def index
    @gymnastics = Gymnastic.group(:name).order(:id).limit(5)

    respond_to do |format|
      format.json {
        render_for_api :full, json: @gymnastics
      }
    end
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
  end
end