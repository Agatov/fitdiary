module ApiV1::ExerciseSet
  extend ActiveSupport::Concern
  included do

    api_accessible :full do |template|
      template.add :id
    end

  end
end