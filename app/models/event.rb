class Event
  attr_accessor :id, :name, :time, :url, :group, :popularity, :date, :font_size

  @@all = []

  def self.all
    @@all
  end

  def self.find_or_create_by(id, name, time, url)
    event = @@all.detect { |event| event.id == id }
    if event.nil?
      Event.new(id, name, time, url)
    else
      event
    end
  end

  def initialize(id, name, time, url)
    @id = id
    @name = name
    @time = time
    @url = url
    @popularity = 0
    @@all << self
  end

  def font_size
    if popularity < 3
      20
    elsif popularity > 15
      40
    else
      28
    end
  end
end