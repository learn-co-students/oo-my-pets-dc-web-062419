require 'pry'

class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs 
  
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

  def buy_cat(cat_name)
   @cats << Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    @dogs << Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy" }  
  end

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    Cat.all.each do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end

    Dog.all.each do |dog| 
      dog.mood = "nervous" 
      dog.owner = nil
    end

  end

  def list_pets
    "I have #{@dogs.length} dog(s), and #{@cats.length} cat(s)."
  end
  
end