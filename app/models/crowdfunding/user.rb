class User 
  attr_reader :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def create_project(goal_amount)
    Project.new(goal_amount, self)
  end
  
  def back_project(pledge_amount, project_obj)
    Pledge.new(pledge_amount, project_obj, self)
  end
  
  def self.highest_pledge
    highest_pledge_obj = Pledge.all.reduce do |highest_pledge_obj, current_pledge_obj|
      if current_pledge_obj.pledge_amount > highest_pledge_obj.pledge_amount
        highest_pledge_obj = current_pledge_obj
      else
        highest_pledge_obj
      end 
    end 
    
    highest_pledge_obj.user
  end

  def self.all_pledge_user_objs
    Pledge.all.map do |pledge_obj|
      pledge_obj.user
    end
  end
  
  def self.multi_pledger
    pledge_count = self.all_pledge_user_objs.reduce do |multi_pledger_hash, pledge_obj|
      if multi_pledger_hash[pledge_obj]
        multi_pledger_hash[pledge_obj] += 1
      else
        multi_pledger_hash[pledge_obj] = 1
      end
    end
    
    pledge_count.select {|pledge_obj, count| count > 1}
  end
  
  def self.project_creator
    all_project_creators = Project.all.map {|project_obj| project_obj.creator}
    
    all_project_creators.uniq
  end
  
  def self.all 
    @@all 
  end
end