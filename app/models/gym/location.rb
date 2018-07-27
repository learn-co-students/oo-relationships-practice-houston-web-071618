class Location
  attr_reader :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def find_all_clients
    Client.all.select do |client_obj|
      client_obj.location == self
    end
  end
  
  def count_clients
    self.find_all_clients.count 
  end
  
  def self.least_clients
    self.all.reduce do |least_clients_location_obj, current_location_obj|
      if current_location_obj.count_clients < least_clients_location_obj.count_clients
        least_clients_location_obj = current_location_obj
      else
        least_clients_location_obj
      end 
    end
  end
  
  def self.all 
    @@all 
  end
end