class Workout < ActiveRecord::Base
  attr_accessible :comment, :date, :user_id
end
