#encoding: utf-8

Допустим /^на сайте размещено преложение о продаже земли "(.*?)"$/ do |plot_title|
  @plot = FactoryGirl.create(:plot, :title => plot_title)
end

Когда /^я перехожу по ссылке "(.*?)" предложения о земле "(.*?)"$/ do |link_title, plot_title|
  @plot = Plot.where(:title => plot_title).first
  find("#plot_#{@plot.id}").find_link(link_title).click
end