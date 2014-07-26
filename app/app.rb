require_relative '../config/environment.rb'

class App < Sinatra::Base

  def initialize 
    Event.delete_all 
    Member.get_members_hash
    @@time_now_in_milliseconds = DateTime.now.strftime('%Q').to_i
  end

  def self.time_now
    @@time_now_in_milliseconds
  end
end
