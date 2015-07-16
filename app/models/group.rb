class Group < ActiveRecord::Base
  has_many  :events

  def assign_color
    self.color ||= "#{rand(80)},#{rand(255)},#{rand(255)}"
    self.save
  end

  def font_size
    if self.members < 5
      20
    elsif self.members > 30
      40
    else
      28
    end
  end
end

