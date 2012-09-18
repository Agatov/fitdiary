module ApiV1::Workout
  extend ActiveSupport::Concern
  included do

    api_accessible :full do |template|
      template.add :id
    end

  end
end