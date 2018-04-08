class AddColumnFruits < ActiveRecord::Migration
  def change
    add_column :fruits, :latitude, :float
    add_column :fruits, :longitude, :float
  end
end
