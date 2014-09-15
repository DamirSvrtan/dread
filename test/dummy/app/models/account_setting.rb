class AccountSetting < ActiveRecord::Base
  belongs_to :user,   dependent: :destroy
  belongs_to :country
end
