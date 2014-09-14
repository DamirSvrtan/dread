class CreateAccountSettings < ActiveRecord::Migration
  def change
    create_table :account_settings do |t|
      t.string :time_zone
      t.integer :country_id

      t.timestamps
    end
  end
end
