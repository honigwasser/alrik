require 'faker'

FactoryBot.define do
  factory :history do
    event { "some change" }
    partial { "some json" }
    created_at { Time.zone.now }
    created_by { 1 }
  end
end
