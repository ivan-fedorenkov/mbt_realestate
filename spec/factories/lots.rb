# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lot do
    sequence(:title) { |n| "A testing lot ##{n}" }
    location_ { StaticLocation::Location.locations[Random.rand(StaticLocation::Location.locations.length)] }
    latitude 29.9902
    longitude 33.0567
    
    plot 230
    price 100000

    location
  end
end
