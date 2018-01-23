class RemoveMemberIdFromHarvests < ActiveRecord::Migration
  def change
    remove_column :harvests, :member_id
  end
end
