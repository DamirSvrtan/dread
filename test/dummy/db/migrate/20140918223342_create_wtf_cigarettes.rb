class CreateWtfCigarettes < ActiveRecord::Migration
  def change
    create_table :wtf_cigarettes do |t|
      t.string :brand

      t.timestamps
    end
  end
end
