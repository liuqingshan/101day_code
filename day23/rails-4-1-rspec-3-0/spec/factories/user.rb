FactoryGirl.define do
  factory :user do
    name  { FFaker::Name.name }
    email { FFaker::Internet.email }
    password 'secret'
    password_confirmation 'secret'
  end
end
