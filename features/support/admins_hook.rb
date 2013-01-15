Before('@admins-only') do |scenario|
  authenticate_admin!
end