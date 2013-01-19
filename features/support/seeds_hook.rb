Before('@require-seed-data') do |scenario|
  load File.join(Rails.root,'db','seeds.rb')  
end  