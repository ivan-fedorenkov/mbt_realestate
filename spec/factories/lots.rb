# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lot do
    title "Test lot title"
    latitude 29.9902
    longitude 33.0567
    location { FactoryGirl.create(:location) }
    plot 230
    price 100000
  end
end
