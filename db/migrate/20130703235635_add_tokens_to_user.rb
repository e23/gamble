class AddTokensToUser < ActiveRecord::Migration
  def change
    add_column :users, :tokens, :integer, default: 1000
  end
end
