class Account < ActiveRecord::Base
  belongs_to :supplier, dependent: :destroy
end
