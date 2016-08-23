class RemoveGuessFromComputerPlayer < ActiveRecord::Migration
  def change
    remove_column :computer_players, :guess, :string
  end
end
