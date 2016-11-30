require 'faker'

FactoryGirl.define do
  factory :talent do
    uuid { "talent-" + SecureRandom.uuid }
    name
  end
end
