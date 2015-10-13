class CreateCompanyOrganizations < ActiveRecord::Migration
  def change
    create_table :company_organizations do |t|
      t.references :company, index: true
      t.references :organization, index: true

      t.timestamps
    end
  end
end
