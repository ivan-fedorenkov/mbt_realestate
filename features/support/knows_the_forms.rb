#encoding: utf-8

module KnowsTheForms
  
  def form_area_xpath_selector_for(form_name)
    return case form_name
      when /входа в учётную запись/
        "//div[@id = 'navigation-panel']"
      when /добавления фотографий/
        "//*[@id = 'add-picture-form']"
      when /добавления региона/
        "//*[@id = 'add-location-form']"
      when /поиска предложений о жилье/
        "//*[@id = 'residential-search-form']"
      when /поиска лотов/
        "//*[@id = 'lots-search-form']"
      when /обратной связи/
        "//*[@id = 'lot-question-form']"
      else
        "//div[@id = 'content']"
    end
  end
  
  def get_form_field(field_human_name)
    return case field_human_name
      when /Наименование/
        "name"
      when /Название/
        "[title]"
      when /Месторасположение/
        ["location", :select_box]
      when /Текст/
        "text" 
      when /Позиция/
        "position"
      when /Стоимость/
        "price"
      when /Цена от/
        ["price_from", :select_box]
      when /Цена до/
        ["price_to", :select_box]
      when /Тип жилья/
        ["lot_internal_type", :select_box]
      when /Тип земли/
        "lot_internal_type"
      when /Количество этажей/
        "levels"
      when /Количество спален/
        "bedrooms"
      when /Площадь дома/
        "covered_area"
      when /Число ванных комнат/
        "baths"
      when /Площадь территории/
        "[plot]"
      when /Частный бассейн/
        "private_pool"
      when /Общественный бассейн/
        "communal_pool"
      when /Описание/
        "description"
      when /Дополнительные характеристики/
        "additional_features"
      when /Email/
        "email"
      when /Password/
        "password"
      when /Широта/
        "latitude"
      when /Долгота/
        "longitude"
      when /Расстояние до моря/
        "distance_to_sea"
      when /Нотариальный акт готов/
        "title_deed_ready"
      when /Площадь веранды/
        "opened_veranda"
      when /Парковочных мест/
        "parking"
      when /Цена с НДС/
        "include_vat"
      when /Дата окончания строительства/
        "delivery_date"

      when /I want to/
        ["type", :select_box]
      when /Where/
        ["location", :select_box]
      when /Price from/
        ["price_from", :select_box]
      when /Price to/
        ["price_to", :select_box]

      when /^([a-zA-Z]+)$/
        "[#{$1}]"

      else
        raise "Поле формы `#{field_human_name}` не найдено. Добавьте его в файл `knows_the_forms.rb`"
    end
  end

  def set_form_field(form_name, field_name, field_value)
    field, field_type = get_form_field(field_name)
    if (field.end_with? "date")
      day,month,year = field_value.split(".")
      find(:xpath, "#{form_area_xpath_selector_for(form_name)}//*[contains(@name,'#{field}(1i)')]").set(year.to_i) if year
      find(:xpath, "#{form_area_xpath_selector_for(form_name)}//*[contains(@name,'#{field}(2i)')]").set(month.to_i) if month
      find(:xpath, "#{form_area_xpath_selector_for(form_name)}//*[contains(@name,'#{field}(3i)')]").set(day.to_i) if day
    else
      case field_type
        when :select_box
          find(:xpath, "#{form_area_xpath_selector_for(form_name)}//*[contains(@name,'#{field}')]/option[text() = '#{field_value}']").select_option if field_value
        else
          field_value = "true" if(field_value =~ /^v$/)
          find(:xpath, "#{form_area_xpath_selector_for(form_name)}//*[contains(@name,'#{field}')]").set(field_value) if field_value
      end
    end
  end
  
  def submit_form!(form = nil)
    page.find(:xpath, "#{form_area_xpath_selector_for(form)}//*[@name = 'commit']").click
  end
end

World(KnowsTheForms)