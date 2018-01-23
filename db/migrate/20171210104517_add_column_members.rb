class AddColumnMembers < ActiveRecord::Migration
  def change
    add_column :members, :join, :string
  end
end
