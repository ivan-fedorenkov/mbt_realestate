#encoding: utf-8

Допустим /^на сайте размещено преложение о жилье "(.*?)"$/ do |residential_title|
  FactoryGirl.create(:residential, :title => residential_title)
end

Когда /^я изменяю название предложения на "(.*?)"$/ do |new_residential_name|
  fill_in "Title", :with => new_residential_name
  find(:xpath, "//*[@name = 'commit']").click
end
