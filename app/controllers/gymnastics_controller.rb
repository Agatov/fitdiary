class GymnasticsController < ApplicationController
  def index
    if params[:s]
      @gymnastics = Gymnastic.order(:name).group(:name).where('name like ?', "%#{params[:s]}%").limit(5)
    else
      @gymnastics = Gymnastic.group(:name).order(:id).limit(5)
    end

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