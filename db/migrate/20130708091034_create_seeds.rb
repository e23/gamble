class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.belongs_to :user
      t.string :site_seed
      t.string :user_seed
      t.integer :rolls

      t.timestamps
    end
    add_index :seeds, :user_id
  end
end
