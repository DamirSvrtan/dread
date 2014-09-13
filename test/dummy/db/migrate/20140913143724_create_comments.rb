class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :tweet_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
