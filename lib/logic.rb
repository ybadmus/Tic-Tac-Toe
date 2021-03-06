class Logic
  SUCCESS_OUTCOMES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
    [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
  ].freeze

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def take_turns(user_input, second_player)
    return false unless valid_entry(user_input)

    @cells.map! { |item| item == user_input ? 'x' : item } unless second_player
    @cells.map! { |item| item == user_input ? 'o' : item } if second_player
    true
  end

  private

  def valid_entry(user_input)
    @cells.include? user_input
  end

  public

  def available_moves
    <<-HEREDOC
      ---+---+---
      #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
      ---+---+---
      #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
      ---+---+---
      #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
      ---+---+---
    HEREDOC
  end

  def check_outcome(active_selections)
    match = SUCCESS_OUTCOMES.select { |item| (item - active_selections).length.zero? }
    match.length >= 1
  end
end
