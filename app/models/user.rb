class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name

  has_many :workouts

  acts_as_api
  include ApiV1::User
end
