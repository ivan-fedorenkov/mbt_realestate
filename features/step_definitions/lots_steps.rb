#encoding: utf-8

Допустим /^на сайте размещен лот "(.*?)"$/ do |lot_title|
  lot(:title => lot_title)
end

Допустим /^на сайте размещены следующие лоты:$/ do |lots|

  lots.map_headers!(
    "Title" => :title,
    "Type" => :type,
    "Location" => :location,
    "Price" => :price)

  lots.hashes.each do | lot_params |
    location = Location.find_by_name(lot_params[:location])
    lot_params[:location] = location
    FactoryGirl.create(:lot, lot_params)
  end
end



То /^результаты поиска (.*)$/ do |search_results|
  
  page_should_display_all_lots_of_type = lambda do |klass|
    klass.all.each do |lot|
      page.should have_content(lot.title)
    end
    klass.where("type != ?", klass.to_s) do |lot|
      page.should_not have_content(lot.title)
    end
  end

  case search_results
    when /все предложения о жилье/ 
      page_should_display_all_lots_of_type.call(Residential)
    when /все предложения для инвестирования/ 
      page_should_display_all_lots_of_type.call(Investment)
    when /все предложения о покупке земли/ 
      page_should_display_all_lots_of_type.call(Plot)
    when /ни одного предложения о жилье/
      Lot.all.each { |lot| page.should_not have_content(lot.title) }
    when /должны содержать следующие предложения о жилье:(.*)/
      residential_titles = $1.strip.split(/\s*,\s*/)
      Residential.all.each do |residential|
        if residential_titles.include? residential.title
          page.should have_content residential.title
        else
          page.should_not have_content residential.title
        end
      end
    else
      raise "Pending"
  end
end
