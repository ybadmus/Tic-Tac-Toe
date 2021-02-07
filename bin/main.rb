#!/usr/bin/env ruby

require_relative 'users'
require_relative 'logic'

require 'pry'

puts 'Press enter to start a new game'
gets.chomp
puts 'Player 1: Choose a nickname'
player1 = gets.chomp
puts 'Player 2: Choose a nickname'
player2 = gets.chomp
users = Users.new(player1, player2)
logic = Logic.new

max_count = 9

(0..max_count).each do |_i|
  active_player = users.second_player ? users.player2 : users.player1
  puts "Player #{users.second_player ? '2' : '1'} - #{active_player}, select an available move!"
  logic.available_moves
  user_input = gets.chomp.to_i
  puts "You selected #{user_input}!"

  unless logic.take_turns(user_input, users.second_player)
    puts 'Sorry you selected an invalid move, please try again!'
    redo
  end

  users.second_player ? users.second_player_selections << user_input : users.first_player_selections << user_input
  active_selections = users.second_player ? users.second_player_selections : users.first_player_selections
  logic.check_outcome(active_selections) ? users.winner : users.second_player = !users.second_player
  _i += 1
end
