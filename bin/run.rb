require 'pry'

require_relative '../lib/cat.rb'
require_relative '../lib/dog.rb'
require_relative '../lib/owner.rb'
john = Owner.new("John")
john.buy_cat("kitty #2")

cat = Cat.new("kitty")
puts cat