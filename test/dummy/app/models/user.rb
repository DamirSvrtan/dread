class User < ActiveRecord::Base
  has_many :tweets,   dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :avatar,    dependent: :destroy,  class_name: 'Picture',        as: :imageable
  has_one :setting,   dependent: :destroy,  class_name: 'AccountSetting'
end