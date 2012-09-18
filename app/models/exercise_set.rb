class ExerciseSet < ActiveRecord::Base
  attr_accessible :exercise_id, :repeats, :weight

  belongs_to :exercise

  acts_as_api
  include ApiV1::ExerciseSet
end
