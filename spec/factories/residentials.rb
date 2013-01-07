# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :residential do
    title "Residential title"
    residential_type :detached_house
    description "Some very interesting residential description"
    levels 1
    bedrooms 1
    covered_area 1
    baths 1
    plot 1
    price 1
    private_pool false
    communal_pool false
  end
end
