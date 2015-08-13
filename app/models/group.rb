class Group < ActiveRecord::Base
  has_many  :events

  def assign_color
    self.color ||= "#{rand(80)},#{rand(255)},#{rand(255)}"
    self.save
  end
end

