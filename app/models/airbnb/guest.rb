class Guest 
  attr_reader :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def listings
    all_listings = self.trips.map do |trip_obj|
      trip_obj.listing
    end
    
    all_listings.uniq
  end
  
  def trips
    Trip.all.select do |trip_obj|
      trip_obj.guest == self
    end
  end
  
  def trip_count
    self.trips.count
  end
  
  def self.all
    @@all  
  end
  
  def self.pro_traveller
    guest_trip_hash_map = Hash.new(0)
    
    Trip.all.each do |trip_obj|
      guest_trip_hash_map[trip_obj.guest] += 1
    end
    
    guest_trip_hash_map.select do |guest, trip_count|
      trip_count > 1
    end
  end
  
  def self.find_all_by_name(name)
    self.all.select {|guest_obj| guest_obj.name == name}
  end
end