require 'rails_helper'

RSpec.describe MaintenancePlan, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:equipment_type) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cost) }
    it { is_expected.to validate_presence_of(:interval) }
    it { is_expected.to validate_numericality_of(:cost) }
    it { is_expected.to validate_numericality_of(:interval).only_integer }
  end
end
