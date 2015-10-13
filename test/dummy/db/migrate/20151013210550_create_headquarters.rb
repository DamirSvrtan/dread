class CreateHeadquarters < ActiveRecord::Migration
  def change
    create_table :headquarters do |t|
      t.references :company, index: true

      t.timestamps
    end
  end
end
