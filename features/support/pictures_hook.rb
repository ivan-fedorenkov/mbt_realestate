require 'fileutils'

After do |scenario|
  FileUtils.rm_rf(Rails.root + 'public/system')
end
