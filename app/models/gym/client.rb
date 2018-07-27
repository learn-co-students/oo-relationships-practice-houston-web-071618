class Client 
  attr_reader :location, :trainer
  
  @@all = []
  
  def initialize(location, trainer=nil)
    @location = location
    @trainer = trainer
    @@all << self
  end
  
  def assign_trainer(trainer_obj)
    @trainer = trainer_obj
  end
  
  def self.all 
    @@all 
  end
end