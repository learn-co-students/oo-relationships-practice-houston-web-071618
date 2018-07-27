require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

Pry.start

michael = Guest.new("Michael")
amanda = Guest.new("Amanda")
olivia = Guest.new("Olivia")

japan = Listing.new("Japan")
israel = Listing.new("Israel")

michael_israel = Trip.new(michael,israel)
amanda_israel = Trip.new(amanda,israel)
michael_japan = Trip.new(michael,japan)
olivia_japan = Trip.new(olivia,japan)
amanda_japan = Trip.new(amanda,japan)

japan.guests
israel.guests

michael.listings 
olivia.listings

Guest.find_all_by_city("Amanda")
Listing.find_all_by_city("Japan")
Listing.most_popular

binding.pry

puts "Hello World"
