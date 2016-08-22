class AddComputerPlayerIdToGames < ActiveRecord::Migration
  def up
    add_column :games, :computer_player_id, :integer
  end

  def down
    remove_column :games, :computer_player_id, :integer
  end
end
