require_relative '../lib/users'

describe Users do
  describe "#create" do
    let(:users) { Users.new("Yusif", "Sheriff") }
    it "creates the two users successfully for the game" do
      player1 = users.player1
      player2 = users.player2
      output = "player1 is Yusif, player2 is Sheriff"
      expect("player1 is #{player1}, player2 is #{player2}").to eq(output)
    end
  end
end
