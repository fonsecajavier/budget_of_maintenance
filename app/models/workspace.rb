class Workspace < ApplicationRecord
  has_many :equipment_types, dependent: :destroy
  has_many :equipment_units, through: :equipment_types

  validates_presence_of :name
end
