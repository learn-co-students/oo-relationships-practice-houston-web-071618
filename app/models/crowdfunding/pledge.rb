class Pledge 
  attr_reader :project, :user, :pledge_amount
  
  @@all = []
  
  def initialize(pledge_amount, project_obj, user_obj)
    @pledge_amount = pledge_amount
    @project = project_obj
    @user = user_obj
    @@all << self
  end
  
  def self.all 
    @@all 
  end
end