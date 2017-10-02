class Workspace < ApplicationRecord
  has_many :equipment_types
  has_many :equipment_units, through: :equipment_types

  validates_presence_of :name
  validates_presence_of :default_monthly_usage
end
