#encoding: utf-8

Допустим /^на сайте размещены следующие предложения о жилье:$/ do |residentials|
  residentials.map_headers!(
    "Название" => :title, 
    "Месторасположение" => :location, 
    "Тип жилья" => :lot_internal_type, 
    "Цена" => :price)

  residentials.hashes.each do |residential_options|
    location = Location.find_by_name(residential_options[:location])
    residential_options[:location] = location
    FactoryGirl.create(:residential, residential_options)
  end

end

Допустим /^я хочу найти предложение о жилье .*?$/ do
end



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

То /^я должен видеть (.*?) в результатах поиска$/ do |residential_titles|
  case residential_titles 
    when "Все предложения о жилье"
      Residential.all.each { |residential| page.should have_content(residential.title) }
    when "Ни одного предложеня о жилье"
      Residential.all.each { |residential| page.should_not have_content(residential.title) }
    when /Все, кроме: (.*)/
      residential_that_i_should_not_see = $1.split(/\s*,\s*/)
      Residential.all.each do |residential|
        if residential_titles.include? residential.title
          page.should_not have_content(residential.title)
        else
          page.should have_content(residential.title)
        end
      end
    else
      residential_titles = residential_titles.split(/\s*,\s*/)
      Residential.all.each do |residential| 
        if residential_titles.include? residential.title
          page.should have_content(residential.title)
        else
          page.should_not have_content(residential.title)
        end
      end
  end
end