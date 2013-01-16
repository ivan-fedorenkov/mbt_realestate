module KnowsTheDomain
	def article(params = {})
    @article ||= FactoryGirl.create(:article, params) 
  end
end

World(KnowsTheDomain)