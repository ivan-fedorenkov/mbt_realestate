#encoding: utf-8

Допустим /^на сайте размещен лот "(.*?)"$/ do |lot_title|
  lot(:title => lot_title)
end

