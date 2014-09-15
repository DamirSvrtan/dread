class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :url
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps
    end
  end
end
