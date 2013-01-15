#encoding: utf-8

module KnowsTheSections
  def get_section_link_title(section_human_name)
    return case section_human_name
      when /администрирования статей/
        "Articles"
      else
        raise "Раздел `#{section_human_name}` не найден. Необходимо добавить раздел в файл `knows_the_sections.rb`"  
    end
  end
end

World(KnowsTheSections)