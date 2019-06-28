require 'pry'

class Owner

  attr_reader :species, :name 
  attr_accessor :cat

  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self

  end

  def self.all
    @@all
  end

  def self.count
    # binding.pry
    @@all.count 
    # binding.pry
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
     "I am a human."

  end

  def buy_cat(cat_names)
    # binding.pry
    Cat.new(cat_names, self)

  end

  def cats
    # binding.pry
    Cat.all.select {|cat| cat.owner == self}
  end

  def buy_dog(dog_names)
    Dog.new(dog_names, self)
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
    # binding.pry
  end

  def walk_dogs
    # binding.pry
    # self.dogs[0].mood = "happy"
    self.dogs.each {|dog| dog.mood = "happy"}

  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  

  def sell_pets
    pets = self.dogs + self.cats
    pets.each do |pet| 
      pet.mood = "nervous"
      pet.owner = nil
    end
    # binding.pry
    
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."



  end

end

lisa = Owner.new("Lisa")
