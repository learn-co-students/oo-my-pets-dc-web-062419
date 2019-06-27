# Cat
#   can initialize a cat (FAILED - 1)
#   initializes with a name (FAILED - 2)
#   can't change its name (FAILED - 3)
#   initializes with a nervous mood (FAILED - 4)
#   can change its mood (FAILED - 5)
#   knows all the cats (FAILED - 6)

class Cat
  attr_reader :name
  attr_accessor :mood, :owner
  @@all = []

  def initialize(name, owner)
    @name = name
    @mood = "nervous"
    @owner = owner
    @@all << self
  end

  def self.all
    @@all
  end
end 
