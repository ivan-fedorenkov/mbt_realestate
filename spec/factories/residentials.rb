# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :residential do
    title "Residential title"
    lot_internal_type :detached_house
    title_deed_ready { true }
    parking 1
    latitude 1.0
    longitude 1.0
    distance_to_sea 100
    opened_veranda 100.0
    levels 1
    bedrooms 1
    covered_area 200.0
    baths 1
    plot 1
    price 1
    private_pool false
    communal_pool false
    location { FactoryGirl.create(:location) }
  end
end
