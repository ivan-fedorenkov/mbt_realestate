#encoding: utf-8

Допустим /^(?:я )?добавляю фотографию "(.*?)"(?: в форму (.*?))?$/ do |picture_path, form|
  form ||= "Форма добавления фотографий"
  attach_file("Picture", File.expand_path(picture_path))
  submit_form! form
end

То /^фотография "(.*?)" должна появиться$/ do |picture|
  find(:xpath, "//img[@src='#{Picture.where(:picture_file_name => picture).first.picture.url(:thumb)}']")
end

То /^я не должен видеть удалённой фотографии$/ do
  has_xpath?("//img[@src='#{picture.picture.url(:thumb)}']").should be_false
end


Когда /^выбираю фотографию "(.*?)"$/ do |picture_name|
  picture = Picture.where(:picture_file_name => picture_name).first
  find(:xpath, "//span[@class='picture' and @id='picture_#{picture.id}']//input[@type='checkbox']").set(true)
end