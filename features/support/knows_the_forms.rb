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
        "type"
      when /Where/
        "location_id"
      when /Price from/
        "price_from"
      when /Price to/
        "price_to"
      else
        raise "Поле формы `#{field_human_name}` не найдено. Добавьте его в файл `knows_the_forms.rb`"
    end
  end
  
  def submit_form!(form = nil)
    page.find(:xpath, "#{form_area_xpath_selector_for(form)}//*[@name = 'commit']").click
  end
end

World(KnowsTheForms)