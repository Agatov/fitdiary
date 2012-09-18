class Workout < ActiveRecord::Base
  attr_accessible :comment, :date, :user_id

  has_many :exercises
  belongs_to :workout
end
