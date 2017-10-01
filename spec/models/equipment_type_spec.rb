require 'rails_helper'

RSpec.describe EquipmentType, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:workspace) }
    it { is_expected.to have_many(:equipment_units) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
