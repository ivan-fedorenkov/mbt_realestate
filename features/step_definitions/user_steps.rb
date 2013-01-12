#encoding: utf-8

Допустим /^я - администратор сайта$/ do
  authenticate_admin!
end

Допустим /^я \- не авторизованный пользователь$/ do

end

Допустим /^на сайте существует учётная запись:$/ do |admin_properties_table|
  admin_properties = {}
  admin_properties_table.raw.each do |property_row|
    admin_properties[property_row[0]] = property_row[1]
  end
  FactoryGirl.create(:admin, admin_properties)
end

То /^я должен увидеть приветственное сообщение$/ do
  step %Q{я должен видеть "Signed in successfully." в зоне нотификаций}
end

То /^я должен увидеть сообщение об ошибке доступа$/ do
  step %Q{я должен видеть "You must be an admin to do that." в зоне нотификаций}
end