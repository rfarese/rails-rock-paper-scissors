class ChangeGames < ActiveRecord::Migration
  def change
    rename_column :users, :games, :games_played
  end
end
