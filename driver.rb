require_relative 'snake'
require_relative 'ladder'
require_relative 'player'
require_relative 'game'

require 'i18n'
require 'byebug'

I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]
I18n.default_locale = :en

game = Game.new

puts "********* Welcome to Snake and Ladders Game ********* \n"
puts "I18n.t(:test) #{I18n.t(:test)}"
print "Enter the numbers of Snakes: "

snake_count = gets.chomp
puts "Enter Snakes Head and Tail positions separated by space"
snake_count.to_i.times do |n|
  game.snakes << Snake.input(n+1)
end

puts "snakes #{game.snakes}"

print "Now Enter the numbers of Ladders: "
ladder_count = gets.chomp
puts "Enter Ladder Start and End positions separated by space"
ladder_count.to_i.times do |n|
  game.ladders << Ladder.input(n+1)
end

puts "ladders #{game.ladders}"

print "Now Enter the numbers of Players: "
player_count = gets.chomp
puts "Enter Name for each player"
player_count.to_i.times do |n|
  game.players << Player.input(n+1)
end

puts "players #{game.players}"
game.play
