#encoding: utf-8

Допустим /^на сайте размещено преложение о жилье "(.*?)"$/ do |residential_title|
  FactoryGirl.create(:residential, :title => residential_title)
end

Когда /^я изменяю название предложения на "(.*?)"$/ do |new_residential_name|
  fill_in "Title", :with => new_residential_name
  find(:xpath, "//*[@name = 'commit']").click
end

То /^я должен видеть все добавленные дополнительные характеристики$/ do
  features_string = @form["Дополнительные характеристики"]
  features_hash = Features.new(features_string).to_hash
  features_hash.map do |feature_name,feature_elements|
    page.find(".feature", :text => feature_name)
    within(".feature", :text => feature_name) do
      feature_elements.each { |element| page.should have_content(element) }
    end
  end
end
