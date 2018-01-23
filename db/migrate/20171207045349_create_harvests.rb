class CreateHarvests < ActiveRecord::Migration
  def change
    create_table :harvests do |t|
      t.string      :fruit_id
      t.string      :member_id
      t.datetime    :harvest_day
      t.integer     :people_number
      t.string      :fruit_quantity
      t.integer     :fruit_price
      t.timestamps
    end
  end
end
