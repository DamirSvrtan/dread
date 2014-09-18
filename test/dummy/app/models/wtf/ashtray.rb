class Wtf::Ashtray < ActiveRecord::Base
  has_many :cigarettes, dependent: :destroy, class: Wtf::Cigarette
end