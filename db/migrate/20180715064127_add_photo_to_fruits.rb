class AddPhotoToFruits < ActiveRecord::Migration
  def change
    add_column :fruits, :photo, :string
  end
end
