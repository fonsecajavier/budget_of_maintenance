class EquipmentType < ApplicationRecord
  belongs_to :workspace
  has_many :equipment_units

  validates_presence_of :name
end
