class EventController < Sinatra::Base
    
  get '/' do
    Event.more
    @events = Event.all.uniq!
    erb :index
  end

  post '/events' do
    Event.more
    redirect '/'
  end

  # the first five members
  # [9053050, 43730002, 2687742, 152155482, 93522962]
end