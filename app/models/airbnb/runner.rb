require_relative './guest.rb'
require_relative './listing.rb'
require_relative './trip.rb'
require 'pry'

joe = Guest.new("joe")
sarah = Guest.new("sarah")
matt = Guest.new("matt")
kim = Guest.new("kim")
sarah2 = Guest.new("sarah")

lodge = Listing.new("Texas")
city = Listing.new("New York")
boat = Listing.new("Portland")
cabana = Listing.new("Portland")

trip1 = Trip.new(lodge, kim)
trip2 = Trip.new(city, matt)
trip3 = Trip.new(cabana, sarah)
trip4 = Trip.new(city, joe)
trip5 = Trip.new(lodge, joe)

binding.pry
puts "hello world"