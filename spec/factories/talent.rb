require 'faker'

FactoryGirl.define do
  factory :talent do
    uuid { "talent-" + SecureRandom.uuid }
    name { Faker::Hipster.word }
    talent_type { "BASE" }
    category { "FIGHT" }
    properties { "MU/KL/IN" }
    created_at { Time.zone.now }
  end
end
