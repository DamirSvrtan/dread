class Supplier < ActiveRecord::Base
  has_one :account, dependent: :destroy
end
