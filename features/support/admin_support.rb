module AdminSupport
  def authenticate_admin!
    @admin ||= FactoryGirl.create(:admin)
    
    visit new_admin_session_path
    
    within('#content') do
      fill_in 'Email', :with => @admin.email
      fill_in 'Password', :with => @admin.password
    
      submit_form!
    end
  end  
end

World(AdminSupport)
