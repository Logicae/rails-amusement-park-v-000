class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride 
      if user.tickets < attraction.tickets && user.height < attraction.min_height
        return "Sorry. " + tickets_height
      elsif user.tickets < attraction.tickets
        return "Sorry. " + tickets
      elsif user.height < attraction.min_height
        return "Sorry. " + height
      end

      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
  end

  def thanks
    "Thanks for riding the #{attraction.name}!"
  end 
  
  def tickets_height
    "You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  end

  def tickets
    "You do not have enough tickets to ride the #{attraction.name}."
  end 

  def height
    "You are not tall enough to ride the #{attraction.name}."
  end

end
