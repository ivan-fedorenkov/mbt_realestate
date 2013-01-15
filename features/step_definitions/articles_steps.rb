#encoding: utf-8

Допустим /^(?:на сайт была добавлена статья|на сайте существует статья) с заголовком "(.*?)"$/ do |title|
  @article = FactoryGirl.create(:article, :title => title)
end

Допустим /^на сайт были добавлены следующие статьи:$/ do |articles_table|
  articles_table.hashes.each do |article_attributes|
    FactoryGirl.create(:article, article_attributes)
  end
end

Тогда /^панель навигации должна содержать ссылку на эту статью$/ do
  visit(root_path)
  find("#navigation-panel").find_link(@article.title).should_not be_nil
end


Тогда /^ссылка на статью "(.*?)" должна располагаться перед ссылкой на статью "(.*?)"$/ do |first_article, second_article|
  visit(root_path)
  find("#navigation-panel").text.should =~ /#{first_article}.*?#{second_article}/
end
