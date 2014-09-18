class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :supplier_id
      t.string :account_number

      t.timestamps
    end
  end
end
