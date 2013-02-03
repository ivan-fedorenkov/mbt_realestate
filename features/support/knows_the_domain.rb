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
  def plot(params = {})
    @plot ||= FactoryGirl.create(:plot, params)
  end
  def investment(params = {})
    @investment ||= FactoryGirl.create(:investment, params)
  end
  def lot(params = {})
    @lot ||= FactoryGirl.create(:residential, params)
  end
end

World(KnowsTheDomain)