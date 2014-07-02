class EventController < Sinatra::Base
    
  get '/' do
    @events = Event.all
    erb :index
  end
  
end