require 'fileutils'

After('@with-attachments') do |scenario|
  FileUtils.rm_rf(File.join(Rails.root,"public","system","test_attachments"))
end
