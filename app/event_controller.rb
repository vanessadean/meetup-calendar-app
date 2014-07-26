class EventController < Sinatra::Base
    
  get '/' do
    @events = Event.includes(:group).all.sort_by { |event| event.date }.uniq
    @groups = @events.collect { |event| event.group }.sort_by{ |group| group.name }.uniq
    @dates = @events.collect { |event| event.event_date }.uniq
    erb :index
  end

  post '/events' do
    Member.get_members
    Event.more
    redirect '/'
  end
end