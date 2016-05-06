require "ffaker"

FactoryGirl.define do
  factory :production do
    name FFaker::Name.name
  end
end
