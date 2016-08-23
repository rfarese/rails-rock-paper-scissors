require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should have_valid(:user_id).when(1, 2, 3) }
  it { should have_valid(:computer_player_id).when(1, 2, 3) }

  describe "#user_winner?" do
    it "returns true if the user has won the game" do
      user = FactoryGirl.create(:user)
      computer_player = ComputerPlayer.create()

      game = Game.create(user_id: user.id, computer_player_id: computer_player.id)
      user.game_round_wins = 2
      user.save

      expect(game.user_winner?).to eq(true)
    end

    it "returns false if the user has not won the game" do
      user = FactoryGirl.create(:user)
      computer_player = ComputerPlayer.create()
      game = Game.create(user_id: user.id, computer_player_id: computer_player.id)

      expect(game.user_winner?).to eq(false)
    end
  end

  describe "#computer_player_winner?" do
    it "returns true if the computer has won the game" do
      user = FactoryGirl.create(:user)
      computer_player = ComputerPlayer.create()

      game = Game.create(user_id: user.id, computer_player_id: computer_player.id)
      computer_player.game_round_wins = 2
      computer_player.save

      expect(game.computer_player_winner?).to eq(true)
    end

    it "returns false if the computer has not won the game" do
      user = FactoryGirl.create(:user)
      computer_player = ComputerPlayer.create()
      game = Game.create(user_id: user.id, computer_player_id: computer_player.id)

      expect(game.computer_player_winner?).to eq(false)
    end
  end

  describe "#winner?" do
    it "it returns false if no one has won the game" do
      user = FactoryGirl.create(:user)
      computer_player = ComputerPlayer.create()
      game = Game.create(user_id: user.id, computer_player_id: computer_player.id)

      expect(game.winner?).to eq(false)
    end

    it "returns the user object if the user has won the game" do
      user = FactoryGirl.create(:user)
      computer_player = ComputerPlayer.create()

      game = Game.create(user_id: user.id, computer_player_id: computer_player.id)
      user.game_round_wins = 2
      user.save

      expect(game.winner?).to eq(user)
    end

    it "returns the computer_player object if the computer has won the game" do
      user = FactoryGirl.create(:user)
      computer_player = ComputerPlayer.create()

      game = Game.create(user_id: user.id, computer_player_id: computer_player.id)
      computer_player.game_round_wins = 2
      computer_player.save

      expect(game.winner?).to eq(computer_player)
    end
  end
end
