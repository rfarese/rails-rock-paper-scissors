class CreateComputerPlayer < ActiveRecord::Migration
  def change
    create_table :computer_players do |t|
      t.string :guess
      t.integer :game_round_wins
    end
  end
end
