#!/usr/bin/env ruby

class Users

  def initialize (player1, player2)
    @player_1 = player1
    @player_2 = player2
    @counts = 0
    @next_player = false
    first_player_selections = []
    second_player_selections = []
  end

  public
  def turns 
    if !@next_player
      puts "Your turn - Player 1"
      first_player_selections = gets.chomp()
      @next_player = true
    else 
      puts "Your turn - Player 2"
      second_player_selections = gets.chomp()
      @next_player = false
  end

  private
  def winner(player_name)
    puts "#{player_name} has won!"
  end

  private
  def draw
    puts "It's a draw, no player won after the game"
  end

  public
  def gameover
    puts "Gameover!"
  end
end


puts "Press any key to start game"
gets.chomp()
puts "The game has started"
puts "Player 1: Choose and nickname"
player_1 = gets.chomp()
puts "Player 2: Choose and nickname"
player_2 = gets.chomp()

users = Users.new(player_1, player_2)
users.turns