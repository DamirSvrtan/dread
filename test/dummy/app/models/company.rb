class Company < ActiveRecord::Base
  has_many :company_organizations
  has_many :organizations, through: :company_organizations
  has_one :headquarter
  has_many :users, dependent: :nullify
end
