class EventController < Sinatra::Base
    
  get '/' do
    Event.more
    @events = Event.group(:date).uniq
    @groups = Group.order(:name).uniq
    erb :index
  end

  post '/events' do
    redirect '/'
  end
end