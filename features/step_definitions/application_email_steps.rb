#encoding: utf-8

То /^администратор сайта должен получить письмо содержащее следующий текст:$/ do |email_text|
 unread_emails_for(admin_email).size.should == 1
 find_email(admin_email, :with_text => email_text)
end
