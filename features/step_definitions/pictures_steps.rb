#encoding: utf-8

Допустим /^добавляю фотографию "(.*?)"$/ do |picture_path|
  attach_file("Picture", File.expand_path(picture_path))
  find(:xpath, "//*[@name = 'commit']").click
end

То /^фотография "(.*?)" должна появиться$/ do |picture|
  find(:xpath, "//img[@src='#{Picture.where(:picture_file_name => picture).first.picture.url(:thumb)}']")
end
