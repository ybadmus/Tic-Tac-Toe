class Users
  attr_accessor :player1, :player2, :second_player, :first_player_selections, :second_player_selections

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @second_player = false
    @first_player_selections = []
    @second_player_selections = []
  end

  def winner
    player_name = @second_player ? @player2 : @player1
    "#{player_name} has won the game!"
  end

  def draw
    "Its a tie, neither #{player1} nor #{player2} was able to win the game!"
  end
end
