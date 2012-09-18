class Exercise < ActiveRecord::Base
  attr_accessible :comment, :gymnastic_id, :timeout, :workout_id

  has_many :exercise_sets
  belongs_to :gymnastic
  belongs_to :workout
end
