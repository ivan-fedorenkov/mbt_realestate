#encoding: utf-8

module KnowsTheForms
  def get_form_field(field_human_name)
    return case field_human_name
      when /Название/
        "title"
      when /Текст/
        "text" 
      when /Позиция/
        "position"
      when /Стоимость/
        "price"
      when /Тип жилья/
        "residential_type"
      when /Количество этажей/
        "levels"
      when /Количество спален/
        "bedrooms"
      when /Площадь дома/
        "covered_area"
      when /Число ванных комнат/
        "baths"
      when /Площадь территории/
        "plot"
      when /Частный бассейн/
        "private_pool"
      when /Общественный бассейн/
        "communal_pool"
      when /Описание/
        "description"
      when /Дополнительные характеристики/
        "Additional features"
      else
        raise "Поле формы `#{field_human_name}` не найдено. Добавьте его в файл `knows_the_forms.rb`"
    end
  end
end

World(KnowsTheForms)