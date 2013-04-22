class Workout < ActiveRecord::Base
  attr_accessible :comment, :date, :user_id

  has_many :exercises
  belongs_to :workout

  # @todo -> вынести в декоратор
  def formatted_date
    I18n.localize date, format: :workout_title
  end

  def month
    I18n.localize date, format: :only_month
  end

  def exercises_preview
    gymnastics = exercises.map {|e| e.gymnastic_name}
    names = gymnastics.join(', ')

    return "#{names.slice(0, 100)}..." if names.length > 100
    names
  end

  # @param [String] gymnastic_name
  # @return [Exercise]
  def add_exercise(gymnastic_name)
    gymnastic = Gymnastic.find_or_create_by_name(gymnastic_name)
    exercises.create(gymnastic: gymnastic)
  end
end
