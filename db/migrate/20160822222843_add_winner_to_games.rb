class AddWinnerToGames < ActiveRecord::Migration
  def up
    add_column :games, :winner, :string
  end

  def down
    remove_column :games, :winner, :string
  end
end
