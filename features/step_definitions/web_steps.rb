#encoding: utf-8

Допустим /^(?:я )?(?:нахожусь|перехожу) на (.*)$/ do |page_human_name|
  visit(get_route(page_human_name))
end

То /^я должен оказаться на (.*)$/ do |page_human_name|
  current_path.should eql(get_route(page_human_name))
end

Когда /^я заполняю поля формы(?: (.*?))? следующими данными:$/ do |form, fields_table|
 
  fields_table.raw.each do |field_row|
    field_row[1] = "true" if(field_row[1] =~ /^v$/)
    find(:xpath, "#{form_area_xpath_selector_for(form)}//*[contains(@name,'#{get_form_field(field_row[0])}')]").set(field_row[1]) if field_row[1]
  end
  step %Q{я отправляю форму #{form}}
end

Когда /^я заполняю поле(?: формы (.*?))? "(.*?)" значением "(.*?)"$/ do |form, field_name, value|
  find(:xpath, "#{form_area_xpath_selector_for(form)}//*[contains(@name,'#{get_form_field(field_name)}')]").set(value)
  @form = {field_name => value}
end

Когда /^оставляю остальные поля формы(?: (.*?))? без изменений$/ do |form|
  step %Q{я отправляю форму #{form}}
end

Когда /^я отправляю форму\s*(?: (.*?))?$/ do |form|
  find(:xpath, "#{form_area_xpath_selector_for(form)}//*[@name = 'commit']").click
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

