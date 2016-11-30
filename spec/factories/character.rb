require 'faker'

FactoryGirl.define do
  factory :character do
    name { "char-" + SecureRandom.uuid }
  end
end
