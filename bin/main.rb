#!/usr/bin/env ruby

class Users
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @counts = 0
    @next_player = false
    @first_player_selections = []
    @second_player_selections = []
  end

  def turns
    if !@next_player
      puts 'Your turn - Player 1'
      @first_player_selections << gets.chomp
      @next_player = true
    else
      puts 'Your turn - Player 2'
      @second_player_selections << gets.chomp
      @next_player = false
    end
  end

  private

  def winner(player_name)
    puts "#{player_name} has won!"
    gameover
  end

  def draw
    puts "It's a tie!"
    gameover
  end

  public

  def gameover
    puts 'Game over!'
  end
end

puts 'Press any key to start game'
gets.chomp
puts 'The game has started'
puts 'Player 1: Choose and nickname'
player1 = gets.chomp
puts 'Player 2: Choose and nickname'
player2 = gets.chomp

users = Users.new(player1, player2)
users.turns
