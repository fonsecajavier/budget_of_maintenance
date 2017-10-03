require 'rails_helper'

RSpec.describe BudgetByEquipmentType do
  describe '#output' do
    let!(:workspace) { create(:workspace, default_monthly_usage: 600) }
    let!(:equipment_type_1) { create(:equipment_type, :with_maintenance_plans, workspace: workspace) }
    let!(:equipment_type_2) { create(:equipment_type, :with_maintenance_plans, workspace: workspace) }
    let!(:equipment_unit_t1_1) { create(:equipment_unit, equipment_type: equipment_type_1, initial_hourmeter: 2500) }
    let!(:equipment_unit_t1_2) { create(:equipment_unit, equipment_type: equipment_type_1, initial_hourmeter: 3900) }
    let!(:equipment_unit_t2_1) { create(:equipment_unit, equipment_type: equipment_type_2, initial_hourmeter: 5000) }

    subject { BudgetByEquipmentType.new(workspace).output }

    before(:each) do
      [60_000, 130_000, 600_000, 1_000_000].each_with_index do |cost, index|
        equipment_type_1.maintenance_plans.order(:interval)[index].update_attribute(:cost, cost)
      end

      [40_000, 90_000, 240_000, 400_000].each_with_index do |cost, index|
        equipment_type_2.maintenance_plans.order(:interval)[index].update_attribute(:cost, cost)
      end
    end

    xit 'returns the right structure' do
      expect(subject).to eq []
    end
  end
end
