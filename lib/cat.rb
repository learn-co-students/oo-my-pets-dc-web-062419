require 'pry'

class Cat

  @@all = []

  attr_reader :name 
  attr_accessor :mood, :owner

  def initialize(name, owner, mood="nervous")
    @mood = mood
    @name = name
    @owner = owner
    @@all << self
  end

  def self.all
    @@all
  end

end