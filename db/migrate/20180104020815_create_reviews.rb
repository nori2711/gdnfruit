class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :harvest_id
      t.integer :user_id
      t.text :review
      t.integer :rate
      t.timestamps
    end
  end
end
