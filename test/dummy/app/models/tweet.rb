class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy, as: :imageable
end
