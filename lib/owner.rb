require 'pry'

class Owner

  attr_reader :name, :cats, :dogs

  @@all = []

  def initialize(name)
    @dogs = []
    @cats = []
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def species(species="human")
    @species = species
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
    @cats << new_cat
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self)
    @dogs << new_dog
  end

  def walk_dogs
  Dog.all.map do |dog|
      if dog.owner == self
        dog.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.map do |cat|
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end

  def sell_pets
    Cat.all.map do |cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end
    Dog.all.map do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end
  end

  def list_pets
    dog_number = @dogs.length
    cat_number = @cats.length
    "I have #{dog_number} dog(s), and #{cat_number} cat(s)."
  end

end