require 'rails_helper'

RSpec.describe EquipmentType, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:workspace) }
    it { is_expected.to have_many(:equipment_units).dependent(:destroy) }
    it { is_expected.to have_many(:maintenance_plans).dependent(:destroy) }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:maintenance_plans).allow_destroy(true) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
