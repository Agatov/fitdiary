class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name

  has_many :workouts
end
