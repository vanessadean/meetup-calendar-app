class Event < ActiveRecord::Base
  belongs_to  :group

  def font_size
    if self.group.popularity < 25
      12
    elsif self.group.popularity > 100
      50
    else
      25
    end
  end

end