class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer  :user_id
      t.integer  :tree_id
      t.text     :comment
      t.timestamps
    end
  end
end
