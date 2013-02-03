#encoding: utf-8

Допустим /^я \- (?:обычный пользователь сайта|посетитель сайта)$/ do
end

Допустим /^(?:я )?(?:нахожусь на|перехожу на|пытаюсь открыть) (.*)$/ do |page_human_name|
  visit(get_route(page_human_name))
end

То /^я должен оказаться на (.*)$/ do |page_human_name|
  current_path.should eql(get_route(page_human_name))
end

Когда /^(?:я )?заполняю поля формы(?: (.*?))? следующими (?:данными|значениями):$/ do |form, fields_table|
  fields_table.raw.each do |field_row|
    set_form_field(form, field_row[0], field_row[1])
  end

  submit_form! form

  @form = {:form_name => form}
end

Когда /^я заполняю поле(?: формы (.*?))? "(.*?)" значением "(.*?)"$/ do |form, field_name, value|
  set_form_field(form, field_name, value)

  @form = {:form_name => form, field_name => value}
end

Когда /^я выбираю "(.*?)" в поле "(.*?)" формы (.*?)$/ do |value, field_name, form|
  set_form_field(form, field_name, value)

  @form = {:form_name => form, field_name => value}
end


Когда /^оставляю остальные поля формы(?: (.*?))? без изменений$/ do |form|
  form ||= @form[:form_name] if @form
  submit_form! form
end

Когда /^(?:я )?отправляю (?:форму|её)(?: (.*?))?$/ do |form|
  form ||= @form[:form_name] if @form
  submit_form! form
end

Когда /^я перехожу по ссылке "([^"]*?)"$/ do |link_title|
  click_link link_title
end

Когда /^(?:я )?нажимаю "(.*?)"$/ do |button_title|
  click_button button_title
end

Допустим /^перехожу в раздел (.*)$/ do |section_human_name|
  within('#navigation-panel') { click_link get_section_link_title(section_human_name) }
end

То /^я должен видеть "(.*?)"$/ do |what|
  should have_content(what)  
end

То /^я не должен видеть "(.*?)"$/ do |what|
  should_not have_content(what)  
end

То /^(?:её|его) название должно измениться на "(.*?)"$/ do |new_name|
  begin
    find("legend").should have_content(new_name)
  rescue => error_legend
  end
  begin
    find("h3").should have_content(new_name)
  rescue => error_h3
  end
  
  if error_legend and error_h3
    raise "Название должно было измениться на `#{new_name}`, но не изменилось"
  end
end

То /^(.*) (в зоне|в списке|расположенной в) (.*)$/ do |actions, where_prefix, where|
  within(get_selector(where_prefix + " " + where)) { step %Q{#{actions}} }
end

То /^я должен (?:у)?видеть сообщение об успехе$/ do
  find("#notifications").find(".alert-success").text.should_not be_empty
end

Тогда /^я не должен ввидеть ссылку "(.*?)" в (.*)$/ do |link_title, where|
  find(get_selector(where)).has_link?(link_title).should be_false
end


То /^покажи мне страницу$/ do
  save_and_open_page
end

