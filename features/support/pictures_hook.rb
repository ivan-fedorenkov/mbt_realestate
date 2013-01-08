require 'fileutils'

After do |scenario|
  Residential.all.each { |r| r.pictures.destroy_all }
end
