module ApiV1::ExerciseSet
  extend ActiveSupport::Concern
  included do

    api_accessible :full do |template|
      template.add :id
      template.add :weight
      template.add :repeats
    end

  end
end