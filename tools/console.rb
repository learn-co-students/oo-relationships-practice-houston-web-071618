require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Pry.start
p "Drivers"
p a = Driver.new("A")
p b = Driver.new("B")
p Driver.all

p "*" * 20

p "Passengers"
p x = Passenger.new("X")
p y = Passenger.new("Y")
p Passenger.all

p "*" * 20

p "Rides"
p a_x = Ride.new(a,x,10)
p a_y = Ride.new(a,y)
p b_x = Ride.new(a,x,20)
p b_y = Ride.new(a,y, 30)

p "*" * 20

p "Driver functions"
p a.passengers
p a.rides
p Driver.all
p Driver.mileage_cap(10)

p "*" * 20

p "Passenger functions"
p y.drivers
p y.rides
p Passenger.all
p y.total_distance
p Passenger.premium_members

binding.pry 
p "*" * 20
