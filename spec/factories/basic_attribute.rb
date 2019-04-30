require 'faker'

FactoryBot.define do
  factory :basic_attribute do
    value { Faker::Number.number(2) }
    created_at { Time.zone.now }

    after(:build) do |a|
      a.basic_attribute_type = build(:basic_attribute_type)
    end
  end

  factory :basic_attribute_type do
    name { %i(Courage Strength Dexterity).sample }
  end
end
