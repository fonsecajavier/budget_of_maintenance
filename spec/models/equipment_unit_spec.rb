require 'rails_helper'

RSpec.describe EquipmentUnit, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:equipment_type) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
