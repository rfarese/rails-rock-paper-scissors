class AddGuessDefaultsToComputerPlayers < ActiveRecord::Migration
  def up
    add_column :computer_players, :guess, :string, null: false, default: ""
  end

  def down
    remove_column :computer_players, :guess, :string, null: false, default: ""
  end
end
