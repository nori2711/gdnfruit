class CreateGovernments < ActiveRecord::Migration
  def change
    create_table :governments do |t|
      t.string  :organ_id
      t.string  :prefecture
      t.string  :hall
      t.string  :hall_email
      t.timestamps
    end
  end
end
