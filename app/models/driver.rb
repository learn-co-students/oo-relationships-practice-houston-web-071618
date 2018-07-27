class Driver

  attr_reader :name
  attr_accessor :mileage

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, mileage = 0)
    @name = name
    # @passenger = passenger
    # @ride = ride
    @mileage = mileage
    @@all << self
  end

  def rides
    Ride.all.select do |ride|
      ride.driver == self
    end
  end

  def passengers
    rides.map do |ride|
      ride.passenger
    end
  end

  def self.mileage_cap(max)
    self.all.select do |driver|
      driver.mileage > max
    end
  end

end
