require_relative "./cat.rb"
require "pry"

class Owner
  attr_reader :species, :name

    @@all_owners = []
    def initialize(name)
      @species = "human"
      @name = name
      @@all_owners << self
    end

    def self.all
      @@all_owners
    end

    def self.count
      @@all_owners.size
    end

    def self.reset_all
      @@all_owners.clear
    end

    def say_species
      "I am a #{@species}."
    end

    def cats
      Cat.all.select{|cat| cat.owner == self}
    end

    def buy_cat(cat_name)
      Cat.new(cat_name, self)
    end

    def dogs
      Dog.all.select{|dog| dog.owner == self}
    end

    def buy_dog(dog_name)
      Dog.new(dog_name, self)
    end

    def walk_dogs
      dogs.each{|dog| dog.mood = "happy"}
    end

    def feed_cats
      cats.each{|cat| cat.mood = "happy"}
    end

    def sell_pets

      self.dogs.each do |dog| 
        dog.owner = nil
        dog.mood = "nervous"
      end

      self.cats.each do |cat|
        cat.owner = nil
        cat.mood = "nervous"
      end
    end

    def list_pets
      "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
    end

end
