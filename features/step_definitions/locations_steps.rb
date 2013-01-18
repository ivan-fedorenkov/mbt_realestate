#encoding: utf-8

Допустим /^на сайт был добавлен регион "(.*?)"$/ do |location_name|
  location(:name => location_name)
end

Когда /^я перехожу по ссылке "(.*?)" региона "(.*?)"$/ do |link_title, location_name|
  @location = Location.where(:name => location_name).first
  find("#location_#{@location.id}").find_link(link_title).click
end

Когда /^я изменяю название региона на "(.*?)"$/ do |new_location_name|
  step %Q{я заполняю поле "Наименование" значением "#{new_location_name}"}
end

То /^я должен видеть регион "(.*?)"$/ do |location_name|
  step %Q{я должен видеть "#{location_name}"}
end

То /^я не должен видеть регион "(.*?)"$/ do |location_name|
  step %Q{я не должен видеть "#{location_name}"}
end