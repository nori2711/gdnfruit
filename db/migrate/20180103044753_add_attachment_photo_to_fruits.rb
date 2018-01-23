class AddAttachmentPhotoToFruits < ActiveRecord::Migration
  def self.up
    change_table :fruits do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :fruits, :photo
  end
end
