# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity

class Logic
  attr_accessor :cells

  MAX_COUNTS = 9
  SUCCESS_OUTCOMES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
    [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
  ].freeze

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def take_turns(user_input)
    unless @cells.include? user_input.to_i
      return false
    end
    @cells.map! { |item| item == user_input.to_i ? 'x' : item }
    true
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

  def check_outcome(active_selections)
    SUCCESS_OUTCOMES.include? active_selections ? true : false
  end

end

# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity