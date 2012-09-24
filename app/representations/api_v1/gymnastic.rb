module ApiV1::Gymnastic
  extend ActiveSupport::Concern
  included do

    api_accessible :list do |template|
      template.add :id
      template.add :name
    end

  end
end