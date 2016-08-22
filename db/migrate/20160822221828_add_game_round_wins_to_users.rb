class AddGameRoundWinsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :game_round_wins, :integer
  end

  def down
    remove_column :users, :game_round_wins, :integer
  end
end
