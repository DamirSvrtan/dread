class CompanyOrganization < ActiveRecord::Base
  belongs_to :company
  belongs_to :organization
end
