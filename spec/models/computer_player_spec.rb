require 'rails_helper'

RSpec.describe ComputerPlayer, type: :model do
  it { should have_valid(:game_round_wins).when(0, 1, 2) }
  it { should have_valid(:guess).when("rock", "paper", "scissors") }

  describe "#new_guess" do
    it "creates a new guess for the computer player" do
      computer_player = ComputerPlayer.new
      old_guess = computer_player.guess
      computer_player.new_guess
      updated_computer_player = ComputerPlayer.find(computer_player.id)

      new_guess = updated_computer_player.guess

      expect(old_guess).to eq("")
      expect(new_guess).to_not eq(old_guess)
      expect(ComputerPlayer.all.first.guess).to eq(new_guess)
    end
  end
end
