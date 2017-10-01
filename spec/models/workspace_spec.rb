require 'rails_helper'

RSpec.describe Workspace, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:equipment_types) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:default_interval_of_maintenance) }
  end
end
