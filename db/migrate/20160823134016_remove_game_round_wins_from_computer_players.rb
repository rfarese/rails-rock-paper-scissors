class RemoveGameRoundWinsFromComputerPlayers < ActiveRecord::Migration
  def change
    remove_column :computer_players, :game_round_wins, :integer
  end
end
