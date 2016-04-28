# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title FFaker::Name.name
    isbn FFaker::Name.name

    factory :invalid_book do
      title nil
    end
  end
end
