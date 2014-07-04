class EventController < Sinatra::Base
    
  get '/' do
    Event.more
    @events = Event.all.sort_by { |event| event.date }
    erb :index
  end

  post '/events' do
    Event.more
    redirect '/'
  end
end