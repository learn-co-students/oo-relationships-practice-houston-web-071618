require "pry"

class Ride
  attr_accessor :passenger, :driver, :distance
  @@all = []

  def initialize(passenger, driver, distance)
    @passenger = passenger
    @driver = driver
    @driver.mileage += distance
    @distance = distance
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    sum = 0
    Ride.all.each do |ride|
      sum += ride.distance
    end
    sum / self.all.length

    #Ride.all.distance.reduce(:+) / self.all.length
  end
end
