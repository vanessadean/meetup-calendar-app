class EventController < Sinatra::Base
    
  get '/' do
    Event.more
    @events = Event.all.sort_by { |event| event.date }.uniq
    @groups = @events.collect { |event| event.group }.uniq
    @dates  = @events.collect { |event| event.event_date }.uniq
    erb :index
  end

  post '/events' do
    Event.more
    redirect '/'
  end
end