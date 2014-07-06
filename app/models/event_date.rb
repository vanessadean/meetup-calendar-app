class EventDate < ActiveRecord::Base
  has_many :events

  def nice_format
    self.event_date.strftime("%A, %B %d, %Y")
  end 
end 