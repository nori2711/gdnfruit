class ChangeDatatypeUserIdOfFruits < ActiveRecord::Migration
  def change
    change_column :fruits, :user_id, :integer
  end
end
