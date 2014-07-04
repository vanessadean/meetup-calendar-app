class Group < ActiveRecord::Base
  has_many  :events

  def assign_color
    self.color ||= "#{rand(80)},#{rand(255)},#{rand(255)}"
  end

  def get_members
    self.number_members ||= 1
    Event.all.each do |event|
      self.number_members += 1 if event.group_id == self.id
    end
    self.save
  end

  def font_size
    if self.number_members < 25
      16
    elsif self.number_members > 100
      48
    else
      36
    end
  end
end