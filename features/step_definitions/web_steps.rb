#encoding: utf-8

Допустим /^(?:я )?(?:нахожусь|перехожу) на (.*)$/ do |page_human_name|
  visit(get_route(page_human_name))
end

То /^я должен оказаться на (.*)$/ do |page_human_name|
  visit(get_route(page_human_name))
end

Когда /^я заполняю поля формы следующими данными:$/ do |fields_table|
  fields_table.raw.each do |field_row|
    field_row[1] = "true" if(field_row[1] =~ /^v$/)
    find(:xpath, "//*[contains(@name,'#{get_form_field(field_row[0])}')]").set(field_row[1]) if field_row[1]
  end
  find(:xpath, "//*[@name = 'commit']").click
end

Когда /^я заполняю поле "(.*?)" значением "(.*?)"$/ do |field_name, value|
  fill_in get_form_field(field_name), :with => value
  @form = {field_name => value}
end

Когда /^оставляю остальные поля формы без изменений$/ do
  find(:xpath, "//*[@name = 'commit']").click
end


То /^я должен видеть "(.*?)"$/ do |what|
  should have_content(what)  
end

То /^я не должен видеть "(.*?)"$/ do |what|
  should_not have_content(what)  
end

То /^(.*) (в зоне|в списке) (.*)$/ do |actions, where_prefix, where|
  within(get_selector(where_prefix + " " + where)) { step %Q{#{actions}} }
end

То /^я должен увидеть сообщение об успехе$/ do
  find("#notifications").find(".alert-info").text.should_not be_empty
end

То /^покажи мне страницу$/ do
  save_and_open_page
end


