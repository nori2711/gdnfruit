class ChangeDatatypeFruitIdOfHarvests < ActiveRecord::Migration
  def change
    change_column :harvests, :fruit_id, :integer
  end
end
