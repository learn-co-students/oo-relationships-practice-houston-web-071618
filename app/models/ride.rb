class Ride

  attr_accessor :driver, :passenger, :distance

  @@all = []

  def initialize(driver, passenger, distance = 0)
    @driver = driver
    @passenger = passenger
    @distance = distance
    @driver.mileage += distance
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance

    total_distance = self.all.reduce(:+) do |ride|
      ride.distance
    end

    num_rides = self.all.count

    total distance / num_rides

  end

end
