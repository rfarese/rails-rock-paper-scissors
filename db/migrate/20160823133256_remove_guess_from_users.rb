class RemoveGuessFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :guess, :string
  end
end
