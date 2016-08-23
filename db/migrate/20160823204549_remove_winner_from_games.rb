class RemoveWinnerFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :winner, :string
  end
end
