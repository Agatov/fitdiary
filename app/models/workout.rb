class Workout < ActiveRecord::Base
  attr_accessible :comment, :date, :user_id

  has_many :exercises
  belongs_to :workout

  # @todo -> вынести в декоратор
  def formatted_date
    I18n.localize date, format: :workout_title
  end

  # @param [String] gymnastic_name
  # @return [Exercise]
  def add_exercise(gymnastic_name)
    gymnastic = Gymnastic.find_or_create_by_name(params[:gymnastic_name])
    exercises.create(gymnastic: gymnastic)
  end
end
