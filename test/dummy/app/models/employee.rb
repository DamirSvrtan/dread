class Employee < ActiveRecord::Base
  has_many :subordinates, class_name: Employee,
                          foreign_key: "manager_id",
                          dependent: :destroy

  belongs_to :manager, class_name: Employee
end