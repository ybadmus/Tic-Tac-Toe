#!/usr/bin/env ruby

require_relative '../lib/users'
require_relative '../lib/logic'

puts 'Press enter to start a new game'
gets.chomp
puts 'Player 1: Choose a nickname'
player1 = gets.chomp
while player1.empty?
  puts 'Player 1: Empty name detected, please try again'
  player1 = gets.chomp
end
puts 'Player 2: Choose a nickname'
player2 = gets.chomp
while player2.empty?
  puts 'Player 2: Empty name detected, please try again'
  player2 = gets.chomp
end
users = Users.new(player1, player2)
logic = Logic.new
MAX_COUNTS = 9
(0...MAX_COUNTS).each do |i|
  active_player = users.second_player ? users.player2 : users.player1
  puts "Player #{users.second_player ? '2' : '1'} - #{active_player}, select an available move!"
  puts logic.available_moves
  user_input = gets.chomp.to_i
  puts "You selected #{user_input}!"

  unless logic.take_turns(user_input, users.second_player)
    puts 'Sorry you selected an invalid move, please try again!'
    redo
  end
  users.second_player ? users.second_player_selections << user_input : users.first_player_selections << user_input
  active_selections = users.second_player ? users.second_player_selections : users.first_player_selections
  if logic.check_outcome(active_selections)
    puts users.winner
    puts logic.available_moves
    break
  elsif !logic.check_outcome(active_selections) && i == MAX_COUNTS - 1
    puts users.draw
    puts logic.available_moves
  else
    users.second_player = !users.second_player
  end
end
