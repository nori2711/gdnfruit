class AddColumnUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :address3, :string
    add_column :users, :nickname, :string
  end
end
