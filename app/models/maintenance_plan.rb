class MaintenancePlan < ApplicationRecord
  belongs_to :equipment_type

  validates_presence_of(:name)
  validates_presence_of(:cost)
  validates_presence_of(:interval)
  validates_numericality_of(:cost)
  validates_numericality_of(:interval, only_integer: true)
end
