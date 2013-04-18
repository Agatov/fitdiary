class ExerciseSet < ActiveRecord::Base
  attr_accessible :exercise_id, :repeats, :weight

  belongs_to :exercise
end
