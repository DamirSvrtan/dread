class CreateWtfAshtrays < ActiveRecord::Migration
  def change
    create_table :wtf_ashtrays do |t|
      t.string :color

      t.timestamps
    end
  end
end
