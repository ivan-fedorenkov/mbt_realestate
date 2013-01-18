module KnowsTheDomain
	def article(params = {})
    @article ||= FactoryGirl.create(:article, params) 
  end
  def residential(params = {})
    @residential ||= FactoryGirl.create(:residential, params)
  end
  def picture(params = {})
    @picture ||= FactoryGirl.create(:picture, params)
  end
  def location(params = {})
    @location ||= FactoryGirl.create(:location, params)
  end
end

World(KnowsTheDomain)