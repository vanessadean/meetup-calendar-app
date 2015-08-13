class EventController < Sinatra::Base
  get '/' do
    App.get_events
    @events = Event.all.group_by { |event| event.date }
    @groups = Group.all.sort_by { |group| group.name }
    erb :index
  end
end