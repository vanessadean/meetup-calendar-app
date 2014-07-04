class Group < ActiveRecord::Base
  has_many  :events
  has_many  :group_members
  has_many  :members, :through => :group_members

  def assign_color
    self.color ||= "#{rand(80)},#{rand(255)},#{rand(255)}"
    self.save
  end

  def font_size
    if self.members.count < 6
      24
    elsif self.members.count > 12
      48
    else
      40
    end
  end
end

