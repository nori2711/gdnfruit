class AddColumnHarvests < ActiveRecord::Migration
  def change
    add_column :harvests, :user_id, :integer
  end
end
