#encoding: utf-8

Допустим /^(?:на сайт была добавлена статья|на сайте существует статья) с заголовком "(.*?)"$/ do |title|
  article(:title => title)
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

Когда /^я перехожу по ссылке "(.*?)" статьи "(.*?)"$/ do |link_title, article_title|
  @article = Article.where(:title => article_title).first
  find("#article_#{@article.id}").find_link(link_title).click
end

Когда /^я изменяю название статьи на "(.*?)"$/ do |new_article_title|
  step %Q{я заполняю поле "Название" значением "#{new_article_title}"}
end

То /^я не должен видеть статью "(.*?)"$/ do |article_title|
  should_not have_content(article_title)
end
