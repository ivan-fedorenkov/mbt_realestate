#encoding: utf-8

Допустим /^на сайте размещено преложение о продаже земли "(.*?)"$/ do |plot_title|
  @plot = FactoryGirl.create(:plot, :title => plot_title)
end

Когда /^я перехожу по ссылке "(.*?)" предложения о земле "(.*?)"$/ do |link_title, plot_title|
  @plot = Plot.where(:title => plot_title).first
  find("#plot_#{@plot.id}").find_link(link_title).click
end

Допустим /^к предложению о земле прикреплена фотография "(.*?)"$/ do |picture_file|
  plot.pictures << picture(:imageable => plot)
end

То /^я должен видеть все сущуствующие предложения о продаже зеили$/ do
  Plot.all.each do |plot|
    should have_content(plot.title)
  end
end
