class Trainer 
  attr_reader :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def find_all_clients
    Client.all.select do |client_obj|
      client_obj.trainer == self
    end
  end
  
  def count_clients
    self.find_all_clients.count 
  end
  
  def self.most_clients
    self.all.reduce do |most_clients_trainer_obj, current_trainer_obj|
      if current_trainer_obj.count_clients > most_clients_trainer_obj.count_clients
        most_clients_trainer_obj = current_trainer_obj
      else
        most_clients_trainer_obj
      end 
    end
  end

  def self.all 
    @@all 
  end
end