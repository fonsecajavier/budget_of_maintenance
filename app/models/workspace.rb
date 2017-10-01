class Workspace < ApplicationRecord
  has_many :equipment_types

  validates_presence_of :name
  validates_presence_of :default_interval_of_maintenance
end
