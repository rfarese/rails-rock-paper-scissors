class RemoveGameRoundWinsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :game_round_wins, :integer
  end
end
