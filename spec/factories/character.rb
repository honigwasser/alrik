require 'faker'

FactoryGirl.define do
  factory :character do
    name { Faker::Superhero.name }
    race { Faker::StarWars.specie }
    profession { Faker::Company.profession }
    sex { Faker::Hacker.abbreviation }

    created_at { Time.zone.now }
    updated_at { Time.zone.now }

    created_by { 1 }
    updated_by { 1 }

    after(:create) do |char|
      rand(10..20).times do
        char.talents << build(:talent)
      end
    end
  end
end
