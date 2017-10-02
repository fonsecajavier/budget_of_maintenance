class EquipmentType < ApplicationRecord
  belongs_to :workspace
  has_many :equipment_units
  has_many :maintenance_plans

  validates_presence_of :name

  accepts_nested_attributes_for :maintenance_plans, allow_destroy: true

  delegate :default_monthly_usage, to: :workspace
end
