require_relative './client.rb'
require_relative './location.rb'
require_relative './trainer.rb'
require 'pry'

downtown = Location.new("downtown")
midtown = Location.new("midtown")
memorial = Location.new("memorial")
woodlands = Location.new("woodlands")
katy = Location.new("katy")

billy = Trainer.new("billy")
michael = Trainer.new("michael")
carol = Trainer.new("carol")

sally = Client.new(downtown,billy)
molly = Client.new(memorial)
jenny = Client.new(downtown,carol)
bobby = Client.new(memorial,carol)
pat = Client.new(downtown,michael)
joey = Client.new(katy)

binding.pry
puts "Hello World"

