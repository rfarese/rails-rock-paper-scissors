class AddGuessToUsers < ActiveRecord::Migration
  def up
    add_column :users, :guess, :string
  end

  def down
    remove_column :users, :guess, :string
  end
end
