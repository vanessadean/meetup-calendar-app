class EventController < Sinatra::Base
    
  get '/' do
    @events = Event.all.uniq
    erb :index
  end
  
end