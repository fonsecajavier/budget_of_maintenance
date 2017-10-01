class EquipmentUnit < ApplicationRecord
  belongs_to :equipment_type

  validates_presence_of :name
end
