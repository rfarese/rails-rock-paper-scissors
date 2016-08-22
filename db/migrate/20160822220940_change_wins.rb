class ChangeWins < ActiveRecord::Migration
  def change
    rename_column :users, :wins, :games_won
  end
end
