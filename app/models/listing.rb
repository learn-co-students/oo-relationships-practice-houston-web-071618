class Listing

  @@all = []
  attr_reader :city, :guest

  def initialize(city)
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end

  def guests
    trips.map do |trip|
      trip.guest
    end
  end

  def trips
    Trip.all.select do |trip|
      trip.listing == self
    end
  end

  def trip_count
    trips.count
  end

  def self.find_all_by_city(city)
    self.all.select do |listing|
      listing.city == city
    end
  end

  def self.most_popular
    popular_trip = self.all.sort_by do |listing|
      listing.trip_count
    end
    popular_trip.last
  end

end
