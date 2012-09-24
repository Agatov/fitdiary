module ApiV1::Exercise
  extend ActiveSupport::Concern
  included do

    api_accessible :full do |template|
      template.add :id
      template.add :gymnastic, template: :list
      template.add :exercise_sets, template: :full
    end

  end
end