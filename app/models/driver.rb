require "pry"

class Driver
  @@all = []
  attr_accessor :name, :mileage

  def initialize(name)
    #@ride = rides
    @name = name
    @mileage = 0
    @@all << self
  end

  def self.all
    @@all
  end

  #get all the rides from the ride class that belong to the instance of the driver(self)
  def rides
    Ride.all.select do |ride|
      ride.driver == self
    end
  end

  #list the passengers from the passenger @@all array from the passenger class and from those select the passengers that share the same ride
  def passengers
    rides.map do |ride|
      ride.passenger
    end
  end

  #select reduces array, and map returns the same num of elements as beginning array.
  def self.mileage_cap(distance)
    self.all.select do |driver|
      driver.mileage > distance
    end
  end
end
