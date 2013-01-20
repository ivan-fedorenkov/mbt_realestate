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
end

World(KnowsTheDomain)