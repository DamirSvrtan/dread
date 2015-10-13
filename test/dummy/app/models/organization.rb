class Organization < ActiveRecord::Base
  has_many :company_organizations
  has_many :companies, through: :company_organizations
end
