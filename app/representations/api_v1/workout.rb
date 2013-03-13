module ApiV1::Workout
  extend ActiveSupport::Concern
  included do

    api_accessible :full do |template|
      template.add :id
      template.add :date
      template.add :exercises, template: :full
    end

  end
end