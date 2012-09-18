class Workout < ActiveRecord::Base
  attr_accessible :comment, :date, :user_id

  has_many :exercises
  belongs_to :workout

  acts_as_api
  include ApiV1::Workout
end
