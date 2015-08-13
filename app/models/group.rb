class Group
  attr_accessor :id, :name, :urlname, :color

  @@all = []

  def self.all
    @@all
  end

  def self.find_or_create_by(id, name, urlname)
    group = @@all.detect { |group| group.id == id }
    if group.nil?
      Group.new(id, name, urlname)
    else
      group
    end
  end

  def initialize(id, name, urlname)
    @id = id
    @name = name
    @urlname = urlname
    @@all << self
  end

  def assign_color
    self.color ||= "#{rand(80)},#{rand(255)},#{rand(255)}"
  end
end

