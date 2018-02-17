class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string  :organ_id
      t.string  :tree_type
      t.string  :tree_name
      t.string  :tree_address1
      t.string  :tree_address2
      t.integer :tree_lat
      t.integer :tree_lon
      t.timestamps
    end
  end
end
