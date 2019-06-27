# Owner
#   Class methods
#     .all returns all instances of Owner that have been created (FAILED - 13)
#     .count returns the number of owners that have been created (FAILED - 14)
#     .reset_all can reset the owners that have been created (FAILED - 15)
#   Instance methods
#     #species
#       initializes with a species (FAILED - 16)
#       can't change its species (FAILED - 17)
#     #say_species
#       can say its species (FAILED - 18)
#     #name
#       can have a name (FAILED - 19)
#       cannot change owner's name (FAILED - 20)
#     #buy_cat
#       can buy a cat that is an instance of the Cat class (FAILED - 21)
#       knows about its cats (FAILED - 22)
#     #buy_dog
#       can buy a dog that is an instance of the Dog class (FAILED - 23)
#       knows about its dogs (FAILED - 24)
#     #walk_dogs
#       walks the dogs which makes the dogs' moods happy (FAILED - 25)
#     #feed_cats
#       feeds cats which makes the cats' moods happy (FAILED - 26)
#     #sell_pets
#       can sell all its pets, which makes them nervous (FAILED - 27)
#       can sell all its pets, which leaves them without an owner (FAILED - 28)
#     #list_pets
#       can list off its pets (FAILED - 29)
require "pry"
class Owner
  attr_reader :species, :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    Owner.all.clear
  end
  
  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self 
    end
  end

  def buy_cat(new_cat)
    Cat.new(new_cat, self)
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end
  
  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def sell_pets
    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

def list_pets
  num_dog = self.dogs.length
  num_cat = self.cats.length
  "I have #{num_dog} dog(s), and #{num_cat} cat(s)."
end 
end
