require "pry"
class Cat
  # code goes here
  attr_accessor :mood, :owner
  attr_reader :name

  @@all = []

  def initialize(name, owner) 
    @name = name
    @mood = "nervous"
    @@all << self
    @species = "cat"
    @owner = owner
  end

  def self.all
    @@all 
  end
  def mood
    @mood
  end
  

end
