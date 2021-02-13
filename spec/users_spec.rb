require_relative '../lib/users'

describe Users do
  describe '#create user' do
    let(:users) { Users.new('Yusif', 'Sheriff') }

    it 'creates the two users successfully for the game' do
      player1 = users.player1
      player2 = users.player2
      output = 'player1 is Yusif, player2 is Sheriff'
      expect("player1 is #{player1}, player2 is #{player2}").to eq(output)
    end
  end

  describe '#winner' do
    let(:users) { Users.new('Yusif', 'Sheriff') }

    it 'displays the winner of the game' do
      output = 'Yusif has won the game!'
      expect(users.winner).to eql(output)
    end
  end

  describe '#draw' do
    let(:users) { Users.new('Yusif', 'Sheriff') }

    it 'displays the tie' do
      output = 'Its a tie, neither Yusif nor Sheriff was able to win the game!'
      expect(users.draw).to eql(output)
    end
  end
end
