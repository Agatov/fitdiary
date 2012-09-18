class Gymnastic < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :exercises
end
