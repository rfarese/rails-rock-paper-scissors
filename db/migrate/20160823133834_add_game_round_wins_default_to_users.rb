class AddGameRoundWinsDefaultToUsers < ActiveRecord::Migration
  def up
    add_column :users, :game_round_wins, :integer, null: false, default: 0
  end

  def down
    remove_column :users, :game_round_wins, :integer, null: false, default: 0
  end
end
