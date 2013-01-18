module KnowsTheDomain
	def article(params = {})
    @article ||= FactoryGirl.create(:article, params) 
  end
  def residential(params = {})
    @residential ||= FactoryGirl.create(:residential, params)
  end
end

World(KnowsTheDomain)