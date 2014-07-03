class Group < ActiveRecord::Base
  has_many  :events

  def self.assign_colors
    self.all.each do |group|
      group.color ||= "#{rand(255)},#{rand(255)},#{rand(255)}"
      group.save
    end
  end

  def self.get_popularity
    Event.all.each do |event|
      group = self.find_by(:id => event.group_id)
      group.popularity ||= 0
      group.popularity += 1
      group.save
    end
  end

end