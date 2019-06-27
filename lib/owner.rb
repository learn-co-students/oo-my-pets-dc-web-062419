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
  end
  def count
    @count = 0
  end
  def buy_cat(cat_name)

  end
end
