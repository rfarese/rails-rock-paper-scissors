class AddUserIdToGames < ActiveRecord::Migration
  def up
    add_column :games, :user_id, :integer
  end

  def down
    remove_column :games, :user_id, :integer
  end
end
