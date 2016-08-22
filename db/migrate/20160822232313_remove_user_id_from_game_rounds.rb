class RemoveUserIdFromGameRounds < ActiveRecord::Migration
  def change
    remove_column :game_rounds, :user_id, :integer 
  end
end
