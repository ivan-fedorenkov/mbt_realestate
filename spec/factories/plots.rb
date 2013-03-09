FactoryGirl.define do
  factory :plot do
    title "Test plot"
    location { StaticLocation::Location.locations[Random.rand(StaticLocation::Location.locations.length)] }
    lot_internal_type "plot"
    latitude 1.0
    longitude 1.0
    plot 100
    price 1000
    description "A plot description"
  end
end