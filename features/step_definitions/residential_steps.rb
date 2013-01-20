#encoding: utf-8

Допустим /^на сайте размещено преложение о жилье "(.*?)"$/ do |residential_title|
  @residential = FactoryGirl.create(:residential, :title => residential_title)
end

Когда /^я изменяю название предложения на "(.*?)"$/ do |new_residential_name|
  step %Q{я заполняю поле "Название" значением "#{new_residential_name}"}
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

Когда /^я перехожу по ссылке "(.*?)" предложения о жилье "(.*?)"$/ do |link_title, residential_title|
  @residential = Residential.where(:title => residential_title).first
  find("#residential_#{@residential.id}").find_link(link_title).click
end

Допустим /^к предложению о жилье прикреплена фотография "(.*?)"$/ do |picture_file|
  residential.pictures << picture(:imageable => residential)
end