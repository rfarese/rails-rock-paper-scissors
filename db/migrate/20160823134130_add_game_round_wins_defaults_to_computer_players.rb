class AddGameRoundWinsDefaultsToComputerPlayers < ActiveRecord::Migration
  def up
    add_column :computer_players, :game_round_wins, :integer, null: false, default: 0
  end

  def down
    remove_column :computer_players, :game_round_wins, :integer, null: false, default: 0
  end
end
