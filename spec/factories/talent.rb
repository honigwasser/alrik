require 'faker'

FactoryBot.define do
  factory :talent do
    value { Faker::Number.number(2) }
    created_at { Time.zone.now }

    after(:build) do |t|
      t.talent_type = build(:talent_type)
    end
  end

  factory :talent_type do
    name { Faker::Hipster.word }
    category { "FIGHT" }
    components { "MU/KL/IN" }
  end
end
