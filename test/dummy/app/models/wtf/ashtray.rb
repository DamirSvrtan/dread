class Wtf::Ashtray < ActiveRecord::Base
  has_many :cigarettes, dependent: :destroy
end