class Ride < ActiveRecord::Base
  
  belongs_to :user 
  belongs_to :attraction

  def take_ride
    errors = []
    if self.user.tickets < attraction.tickets
      errors << "You do not have enough tickets to ride the #{attraction.name}."
    end 
      
    if self.user.height < attraction.min_height
      errors << "You are not tall enough to ride the #{attraction.name}."
    end 

    unless errors.empty?
      return 'Sorry. ' + errors.join(" ")
    end  

    self.user.tickets -= attraction.tickets
    self.user.nausea += attraction.nausea_rating
    self.user.happiness += attraction.happiness_rating
    self.user.save
  end  

end
