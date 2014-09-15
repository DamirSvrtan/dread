class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet
  has_many :pictures, dependent: :destroy, as: :imageable
end
