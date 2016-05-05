# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :production do
    name FFaker::Name.name
  end
end
