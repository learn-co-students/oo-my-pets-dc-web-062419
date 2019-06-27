
# Dog
#   can initialize a dog (FAILED - 7)
#   initializes with a name (FAILED - 8)
#   can't change its name (FAILED - 9)
#   initializes with a nervous mood (FAILED - 10)
#   can change its mood (FAILED - 11)
#   knows all the dogs (FAILED - 12)

class Dog
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

