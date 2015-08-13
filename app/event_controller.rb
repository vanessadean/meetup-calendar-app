class EventController < Sinatra::Base
  get '/' do
    Event.get_events
    @events = Event.all.group_by { |event| event.date }
    @groups = Group.order(:name)
    erb :index
  end
end