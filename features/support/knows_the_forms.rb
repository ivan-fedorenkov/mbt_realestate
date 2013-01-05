#encoding: utf-8

module KnowsTheForms
  def get_form_field(field_human_name)
    return case field_human_name
      when /Название/
        "title"
      when /Текст/
        "text" 
    end
  end
end

World(KnowsTheForms)