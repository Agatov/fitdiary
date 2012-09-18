class Gymnastic < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :exercises

  acts_as_api
  include ApiV1::Gymnastic
end
