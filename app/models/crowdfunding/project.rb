class Project 
  attr_reader :goal, :creator
  
  @@all = []
  
  def initialize(goal_amount, creator)
    @creator = creator
    @goal = goal_amount
    @@all << self
  end
  
  def self.no_pledges
    pledged_projects = Pledge.all.map {|pledge_obj| pledge_obj.project}
    self.all - pledged_projects
  end
  
  def self.total_pledged_by_project
    Pledge.all.reduce do |combined_hash, pledge_obj|
      if combined_hash[pledge_obj.project]
        combined_hash[pledge_obj.project] += pledge_obj.pledge_amount
      else
        combined_hash[pledge_obj.project] = pledge_obj.pledge_amount
      end 
    end
  end
  
  def self.above_goal
    project_pledges_hash = self.total_pledged_by_project
    
    self.all.select do |project_obj|
      project_obj.goal_amount > project_pledges_hash[project_obj]
    end
  end
  
  def all_pledges
    Pledge.all.select do |pledge_obj|
      pledge_obj.project == self
    end
  end
  
  def backer_count
    project_pledges = self.all_pledges
    
    pledged_users = project_pledges.map {|pledge_obj| pledge_obj.user}
    
    pledged_users.uniq.count
  end
  
  def self.most_backers
    most_backers_pledge_obj = Pledge.all.reduce do |highest_pledge_obj, current_pledge_obj|
      
    end
  end
  
  def self.all 
    @@all 
  end
end