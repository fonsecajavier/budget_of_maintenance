class Workspace < ApplicationRecord
  has_many :equipment_types

  validates_presence_of :name
  validates_presence_of :default_maintenance_interval
end
