FactoryGirl.define do
  factory :plot do
    title "Test plot"
    lot_internal_type "plot"
    latitude 1.0
    longitude 1.0
    plot 100
    price 1000
    description "A plot description"
    location { FactoryGirl.create(:location) }
  end
end