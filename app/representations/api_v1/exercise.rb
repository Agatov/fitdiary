module ApiV1::Exercise
  extend ActiveSupport::Concern
  included do

    api_accessible :full do |template|
      template.add :id
      template.add :gymnastic_name
      template.add :exercise_sets, template: :full
    end

  end
end