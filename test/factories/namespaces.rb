FactoryBot.define do
  factory :namespace do
    team { Faker::Team.name }
    application { Faker::App.name }
    environment { %w(prod stage dev qa).sample }
  end
end
