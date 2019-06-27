require 'pry'
require_relative "./cat.rb"
require_relative "./dog.rb"

class Owner
  attr_reader :name, :species
  attr_accessor :owned_cats, :owned_dogs, :pets

  @@all_owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = []
    @@all_owners << self
  end

  def self.all
    @@all_owners
  end

  def self.count
    @@all_owners.size
  end

  def self.reset_all
    @@all_owners = []
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def buy_cat(new_cat)
    # Make a new instance of the appropriate pet, initializing it with that name and the owner who is purchasing it
    Cat.new(new_cat, self)
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end

  # An owner should have the ability to walk all their dogs or feed all their cats, which will change the mood of all of their pets of that type to "happy"
  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end

  def pets
    @pets = dogs.push(cats).flatten
  end

  def sell_pets
    self.pets.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"
    end

    ## above is refactored version of the code below

    # dogs.map do |dog|
    #   dog.owner = nil
    #   dog.mood = "nervous"
    # end

    # cats.map do |cat|
    #   cat.owner = nil
    #   cat.mood = "nervous"
    # end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end