#encoding: utf-8

Допустим /^на сайте размещено преложение для инвестирования "(.*?)"$/ do |investment_title|
  @investment = FactoryGirl.create(:investment, :title => investment_title)
end

Когда /^я перехожу по ссылке "(.*?)" предложения для инвестирования "(.*?)"$/ do |link_title, investment_title|
  @investment = Investment.where(:title => investment_title).first
  find("#investment_#{@investment.id}").find_link(link_title).click
end

Допустим /^к предложению для инвестирования прикреплена фотография "(.*?)"$/ do |picture_file|
  investment.pictures << picture(:imageable => investment)
end

То /^я должен видеть все сущуствующие предложения для инвестирования$/ do
  Investment.all.each do |investment|
    should have_content(investment.title)
  end
end

