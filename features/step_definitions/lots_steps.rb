#encoding: utf-8

Допустим /^на сайте размещен лот "(.*?)"$/ do |lot_title|
  lot(:title => lot_title)
end

Допустим /^на сайт(?:е)? (?:размещены|добавлены) следующие лоты:$/ do |lots|

  lots.map_headers! do |header|
    header.downcase.gsub(/\s+/,'_').to_sym
  end

  lots.hashes.each do | lot_params |
    if lot_params[:location]
      lot_params[:location_] = lot_params[:location]
      lot_params.delete(:location)
    end
    FactoryGirl.create(:lot, lot_params)
  end
end



То /^результаты поиска (.*)$/ do |search_results|
  
  get_class = lambda do |lot_type|
    case lot_type
      when /о жилье/
        klass = Residential
      when /для инвестирования/
        klass = Investment
      when /о покупке земли/
        klass = Plot 
      else
        raise "Can't find class for `#{lot_type}`"
    end

    return klass
  end

  case search_results
    when /^должны содержать все предложения (.*)$/ 

      klass = get_class.call($1)
       
      klass.all.each do |lot|
        page.should have_content(lot.title)
      end
      klass.where("type != ?", klass.to_s) do |lot|
        page.should_not have_content(lot.title)
      end

    when /ни одного предложения о жилье/
      Lot.all.each { |lot| page.should_not have_content(lot.title) }
      
    when /^должны содержать только следующие предложения (.*)$/
      lot_type, lot_titles = $1.strip.split(/\s*:\s*/)
      klass = get_class.call(lot_type)

      lot_titles = lot_titles.split(/\s*,\s*/)
      klass.all.each do |lot|
        if lot_titles.include? lot.title
          page.should have_content lot.title
        else
          page.should_not have_content lot.title
        end
      end
    else
      raise "Pending"
  end
end

Когда /^я применяю поисковой фильтр "(.*?)"$/ do |search_filter|
  find(".lots-search-filters").find_link(search_filter).click
end

Когда /^я сбрасываю поисковой фильтр$/ do
  find(".lots-search-filters").find_link("All").click
end
