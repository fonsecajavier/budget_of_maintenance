require 'rails_helper'

RSpec.describe EquipmentUnit, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:equipment_type) }
    it { is_expected.to have_many(:maintenance_plans).through(:equipment_type) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:initial_hourmeter) }
    it { is_expected.to validate_presence_of(:monthly_usage) }
  end

  describe '#max_yearly_usage' do
    subject { build(:equipment_unit, initial_hourmeter: 3090, monthly_usage: 500) }

    it 'should return the right value' do
      expect(subject.max_yearly_usage).to eq(9090)
    end
  end

  describe '#maintenance_stops' do
    let(:equipment_type) { create(:equipment_type, :with_maintenance_plans) }
    subject { build(:equipment_unit, equipment_type: equipment_type, initial_hourmeter: 3090, monthly_usage: 500) }

    it 'returns a sorted set' do
      expect(subject.maintenance_stops).to be_a(Array)
    end

    it 'returns the right values' do
      expect(subject.maintenance_stops.to_a).to eq(
        [3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500, 6750, 7000, 7250, 7500, 7750, 8000, 8250, 8500, 8750, 9000]
      )
    end
  end

  describe '#all_monthly_budgets' do
    let(:workspace) { create(:workspace, default_monthly_usage: 600) }
    let(:equipment_type) { create(:equipment_type, :with_maintenance_plans, workspace: workspace) }
    subject { build(:equipment_unit, equipment_type: equipment_type, initial_hourmeter: 2450) }

    xit 'returns an array with the budget for each month of the year' do
      expect(subject.all_monthly_budgets).to eq [

      ]
    end
  end
end
