class AddGuessDefaultsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :guess, :string, null: false, default: ""
  end

  def down
    remove_column :users, :guess, :string, null: false, default: ""
  end
end
