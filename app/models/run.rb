require "./ride.rb"
require "./driver.rb"
require "./passenger.rb"

bob = Driver.new("Bob")
lisa = Driver.new("Lisa")
billy_passenger = Passenger.new("BillyPassenger")
robert_passenger = Passenger.new("RobertPassenger")
ride1 = Ride.new(billy_passenger, bob, 6)
ride2 = Ride.new(robert_passenger, lisa, 10)
ride3 = Ride.new(robert_passenger, bob, 1000)

blah = Ride.all
blah.each do |ride|
  puts ride.driver.name
end
puts "~~~~~~~~~~"
puts Driver.mileage_cap(100)[0].name
puts "~~~~~~~~~~~~~"
puts Ride.average_distance
