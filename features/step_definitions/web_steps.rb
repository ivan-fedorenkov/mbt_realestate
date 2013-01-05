#encoding: utf-8

Допустим /^(?:я )?нахожусь на (.*)$/ do |page_human_name|
  visit(get_route(page_human_name))
end

Когда /^я заполняю поля формы следующими данными:$/ do |fields_table|
  fields_table.hashes.each do |fields_row|
    fields_row.keys.each do |field_name|
      find(:xpath, "//*[contains(@name,'#{get_form_field(field_name)}')]").set(fields_row[field_name])
    end
  end
  find(:xpath, "//*[@name = 'commit']").click
end

То /^я должен увидеть сообщение об успехе$/ do
  find("#notifications").find(".alert-info").text.should_not be_empty
end
