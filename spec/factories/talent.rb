require 'faker'

FactoryGirl.define do
  factory :talent do
    uuid { "talent-" + SecureRandom.uuid }
    name { Faker::Hipster.word }
    created_at { Time.zone.now }
  end
end
