require 'faker'

FactoryGirl.define do
  factory :character do
    name { Faker::Superhero.name }
    race { Faker::StarWars.specie }
    profession { Faker::Company.profession }
    sex { Faker::Hacker.abbreviation }
    age { 17 }
    weight { 84 }
    height { 184 }
    eye_color { "grey" }
    hair_color { "black" }

    created_at { Time.zone.now }
    updated_at { Time.zone.now }

    created_by { 1 }
    updated_by { 1 }

    after(:create) do |char|
      rand(10..20).times do
        char.talents << build(:talent)
      end
      char.basic_attributes << build(:basic_attribute)
    end
  end
end
