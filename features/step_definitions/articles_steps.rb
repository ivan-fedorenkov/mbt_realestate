#encoding: utf-8

Допустим /^на сайт была добавлена новая статья с заголовком "(.*?)"$/ do |title|
  @article = FactoryGirl.create(:article, :title => title)
end

Тогда /^панель навигации должна содержать ссылку на эту статью$/ do
  visit(root_path)
  find("#navigation-panel").find_link(@article.title).should_not be_nil
end