module ApiV1::Exercise
  extend ActiveSupport::Concern
  included do

    api_accessible :full do |template|
      template.add :id
    end

  end
end