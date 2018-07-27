class Listing 
  attr_reader :city
  
  @@all = []
  
  def initialize(city)
    @city = city 
    @@all << self
  end
  
  def guests
    all_guests = self.trips.map do |trip_obj|
      trip_obj.guest
    end
    
    all_guests.uniq
  end 
  
  def trips
    Trip.all.select do |trip_obj|
      trip_obj.listing == self
    end
  end
  
  def trip_count
    self.trips.count 
  end
  
  def self.all 
    @@all 
  end 
  
  def self.find_all_by_city(city_name_string)
    self.all.select {|listing_obj| listing_obj.city == city_name_string}
  end
  
  def self.most_popular
    self.all.reduce do |popular_listing_obj, current_listing_obj|
      if current_listing_obj.trip_count > popular_listing_obj.trip_count
        popular_listing_obj = current_listing_obj
      else
        popular_listing_obj
      end
    end
  end
end