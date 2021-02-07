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
  active_player = users.next_player ? users.player2 : users.player1
  puts "Player #{users.next_player ? '2' : '1'} - #{active_player}, select an available move!"
  logic.available_moves
  user_input = gets.chomp.to_i
  puts "You selected #{user_input}!"
  unless logic.take_turns(user_input)
    puts 'Sorry you selected an invalid move, please try again!'
    users.next_player = !users.next_player
    next
  end

  users.next_player ? users.second_player_selections << user_input : users.first_player_selections << user_input
  active_selections = users.next_player ? users.second_player_selections : users.first_player_selections
  logic.check_outcome(active_selections) ? users.winner : users.next_player = !users.next_player
end
