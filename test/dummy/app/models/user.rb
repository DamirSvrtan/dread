class User < ActiveRecord::Base
  has_many :tweets,   dependent: :destroy
  has_many :comments, dependent: :destroy
end