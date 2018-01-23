class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.string      :user_id
      t.string      :fruit_name
      t.string      :fruit_address1
      t.string      :fruit_address2
      t.string      :fruit_address3
      t.text        :fruit_detail
      t.string      :harvest_season
      t.string      :harvest_people
      t.timestamps
    end
  end
end
