#encoding: utf-8

Допустим /^добавляю фотографию "(.*?)"(?: в форму (.*?))?$/ do |picture_path, form|
  attach_file("Picture", File.expand_path(picture_path))
  submit_form! form
end

То /^фотография "(.*?)" должна появиться$/ do |picture|
  find(:xpath, "//img[@src='#{Picture.where(:picture_file_name => picture).first.picture.url(:thumb)}']")
end
