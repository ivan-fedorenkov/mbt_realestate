module EmailSupport
  def admin_email
    Rails.configuration.admin_email
  end
end

World(EmailSupport)