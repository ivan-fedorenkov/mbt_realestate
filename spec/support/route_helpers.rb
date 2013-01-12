module RouteHelpers
  def redirect_to_root
    redirect_to('articles#index')
  end
  def redirect_to_sign_in
    redirect_to('/admins/sign_in')
  end
end

RSpec.configure do |config|
  config.include RouteHelpers
end
