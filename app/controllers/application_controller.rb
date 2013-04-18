class ApplicationController < ActionController::Base
  protect_from_forgery

  def index

  end

  def current_user
    @current_user ||= User.first
  end

  helper_method :current_user
end
