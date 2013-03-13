module Admin::ResidentialHelper
  def residential_form_url_for(residential)
    unless residential.persisted?
      return admin_residential_index_path
    else
      return admin_residential_path(residential)
    end
  end
end