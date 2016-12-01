require 'faker'

FactoryGirl.define do
  factory :character do
    uuid { "char-" + SecureRandom.uuid }
    name { Faker::Superhero.name }

    created_at { Time.zone.now }
    updated_at { Time.zone.now }

    created_by { 1 }
    updated_by { 1 }

    after(:build) do |char|
      rand(10..20).times do
        char.talents << build(:talent)
      end
    end
  end
end
