#encoding: utf-8

Допустим /^я - администратор сайта$/ do
  
end

Допустим /^на сайте существует учётная запись:$/ do |admin_properties_table|
  admin_properties = {}
  admin_properties_table.raw.each do |property_row|
    admin_properties[property_row[0]] = property_row[1]
  end
  admin = FactoryGirl.create(:admin, admin_properties)
end

То /^я должен увидеть приветственное сообщение$/ do
  step %Q{я должен видеть "Signed in successfully." в зоне нотификаций}
end
