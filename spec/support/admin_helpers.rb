module AdminHelpers
  def authenticate_admin!
    @admin = FactoryGirl.create(:admin)
    sign_in :admin, @admin
  end
end

RSpec.configure do |config|
  config.include AdminHelpers
end
