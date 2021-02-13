require_relative '../lib/logic'

describe Logic do
  describe '#take_turns' do
    let(:logic) { Logic.new }
    let(:cells) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

    it 'it accepts entries between 1 and 9' do
      expect(logic.take_turns(rand(1..9), false)).to be_truthy
    end

    it 'assigns x as first user initials' do
      output = <<-HEREDOC
      ---+---+---
      x | #{cells[1]} | #{cells[2]}
      ---+---+---
      #{cells[3]} | #{cells[4]} | #{cells[5]}
      ---+---+---
      #{cells[6]} | #{cells[7]} | #{cells[8]}
      ---+---+---
      HEREDOC
      logic.take_turns(1, false)
      expect(logic.available_moves).to eq(output)
    end

    it 'assigns o as second user initials' do
      output = <<-HEREDOC
      ---+---+---
      #{cells[0]} | #{cells[1]} | #{cells[2]}
      ---+---+---
      #{cells[3]} | o | #{cells[5]}
      ---+---+---
      #{cells[6]} | #{cells[7]} | #{cells[8]}
      ---+---+---
      HEREDOC
      logic.take_turns(5, true)
      expect(logic.available_moves).to eq(output)
    end
  end

  describe '#outcomes' do
    let(:logic) { Logic.new }
    let(:three_inputs_success) do
      [
        [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
        [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
      ].freeze
    end
    let(:four_inputs_success) do
      [
        [1, 2, 5, 3], [4, 8, 5, 6], [2, 7, 8, 9], [1, 2, 4, 7],
        [2, 9, 5, 8], [1, 3, 6, 9], [1, 5, 9, 4], [3, 4, 5, 7]
      ].freeze
    end
    let(:five_inputs_success) do
      [
        [1, 8, 2, 5, 3], [2, 4, 8, 5, 6], [2, 5, 7, 8, 9], [1, 2, 4, 8, 7],
        [2, 9, 5, 8, 7], [1, 3, 6, 8, 9], [1, 3, 5, 9, 4], [3, 4, 5, 7, 9]
      ].freeze
    end

    it 'returns true when there is a winning pattern after three rounds of play' do
      flag = false
      three_inputs_success.each { |item| flag = logic.check_outcome(item) }
      expect(flag).to be_truthy
    end

    it 'returns true when there is a winning pattern after four rounds of play' do
      flag = false
      four_inputs_success.each { |item| flag = logic.check_outcome(item) }
      expect(flag).to be_truthy
    end

    it 'returns true when there is a winning pattern after five rounds of play' do
      flag = false
      four_inputs_success.each { |item| flag = logic.check_outcome(item) }
      expect(flag).to be_truthy
    end
  end
end
