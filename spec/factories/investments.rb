FactoryGirl.define do
  factory :investment do
    title "Investment title"
    location_ { StaticLocation::Location.locations[Random.rand(StaticLocation::Location.locations.length)] }
    lot_internal_type :detached_house
    include_vat { true }
    delivery_date { Date.today }
    parking "1 - 2"
    latitude 33.0
    longitude 33.0
    distance_to_sea 100
    opened_veranda "100.0 - 112.5"
    levels "1 - 4"
    bedrooms "1 - 2"
    covered_area "200.0 - 212.4"
    baths "1 - 2"
    plot "400 - 500"
    price "1000000 - 1100000"
    private_pool false
    communal_pool false
    description "An investment description"

    location
  end
end