class Guest

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def listings
    trips.map do |trip|
      trip.listing
    end
  end

  def trips
    Trip.all.select do |trip|
      trip.guest == self
    end
  end

  def trip_count
    trips.count
  end

  def self.find_all_by_name(name)
    self.all.select do |guest|
      guest.name == name
    end
  end

end
