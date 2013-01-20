# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    picture { File.open(File.join(Rails.root,"spec","fixtures","test_picture.jpg")) }
    imageable { FactoryGirl.create(:residential) }
  end
end
