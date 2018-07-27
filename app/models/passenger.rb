class Passenger

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def rides
    Ride.all.select do |ride|
      ride.passenger == self
    end
  end

  def drivers
    rides.map do |ride|
      ride.driver
    end
  end

  def total_distance
    # sum = 0
    # rides.each do |ride|
    #   sum+= ride.distance
    # end
    # sum
    #
    # ... or ...

    distances = rides.map do |ride|
      ride.distance
    end
    distances.reduce(:+)

  end

  def self.premium_members
    self.all.select do |member|
      member.total_distance >100
    end
  end

end
