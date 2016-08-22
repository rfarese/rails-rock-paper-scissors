class RemoveComputerPlayerIdFromGameRounds < ActiveRecord::Migration
  def change
    remove_column :game_rounds, :computer_player_id, :integer
  end
end
