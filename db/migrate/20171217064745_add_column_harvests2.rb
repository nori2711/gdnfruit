class AddColumnHarvests2 < ActiveRecord::Migration
  def change
    add_column :harvests, :members_count, :integer, default: 0
  end
end
