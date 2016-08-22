class CreateGameRounds < ActiveRecord::Migration
  def change
    create_table :game_rounds do |t|
      t.integer :game_id, null: false
      t.integer :user_id, null: false
      t.integer :computer_player_id, null: false
    end
  end
end
