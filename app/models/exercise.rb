class Exercise < ActiveRecord::Base
  attr_accessible :comment, :gymnastic_id, :gymnastic, :timeout, :workout_id
  attr_accessible :exercise_sets_attributes

  has_many :exercise_sets
  accepts_nested_attributes_for :exercise_sets

  belongs_to :gymnastic
  belongs_to :workout

  def gymnastic_name
    gymnastic.name
  end
end
