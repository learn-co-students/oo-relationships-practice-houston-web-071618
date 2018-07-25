require "pry"

class Passenger
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  #pull from the ride class, select the ride where the ride.passenger is == self
  def rides
    Ride.all.select do |ride|
      ride.passenger == self
    end
  end

  #pull from the ride class, select the rides that a passenger has shared with the driver. ride.passenger
  def drivers
    rides.map do |ride|
      ride.driver
    end
  end
end
