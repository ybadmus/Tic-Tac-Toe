#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity

class Users
  MAX_COUNTS = 9
  SUCCESS_OUTCOMES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
    [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
  ].freeze

  def initialize(player1, player2)
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player1 = player1
    @player2 = player2
    @counts = 0
    @next_player = false
    @first_player_selections = []
    @second_player_selections = []
  end

  def take_turns
    (0..MAX_COUNTS).each do |_i|
      puts "Player #{@next_player ? '2' : '1'}, Select from the available moves!"
      available_moves
      user_input = gets.chomp
      puts 'It is a winning move' if user_input == 6
      puts 'It is a draw move' if user_input == 3
      unless @cells.include? user_input.to_i
        puts 'Invalid move!'
        next
      end

      @cells.reject! { |item| item == user_input.to_i }
      @next_player ? @second_player_selections << user_input.to_i : @first_player_selections << user_input.to_i
      @counts += 1
      break if check_outcome
    end
  end

  private

  def check_outcome
    active_selections = @next_player ? @second_player_selections : @first_player_selections
    if SUCCESS_OUTCOMES.include? active_selections
      player_name = @next_player ? @player2 : @player1
      puts "#{player_name} has won!"
      gameover
      true
    elsif (SUCCESS_OUTCOMES.include? active_selections) && @counts == MAX_COUNTS
      puts "It's a tie!"
      gameover
      true
    else
      @next_player = !@next_player
      false
    end
  end

  def available_moves
    puts <<-HEREDOC
      ---+---+---
      #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
      ---+---+---
      #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
      ---+---+---
      #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
      ---+---+---
    HEREDOC
  end

  public

  def gameover
    puts 'Game over!'
  end
end

# rubocop:enable Metrics/CyclomaticComplexity

puts 'Press enter to start game'
gets.chomp
puts 'Player 1: Choose and nickname'
player1 = gets.chomp
puts 'Player 2: Choose and nickname'
player2 = gets.chomp

users = Users.new(player1, player2)
users.take_turns
