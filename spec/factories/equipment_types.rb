FactoryGirl.define do
  factory :equipment_type do
    sequence(:name) { |n| "Equipment Type #{n}" }
    workspace

    trait :with_maintenance_plans do
      after(:create) do |equipment_type, evaluator|
        create(:maintenance_plan, equipment_type: equipment_type, name: 'PM 250', cost: 100_000, interval: 250)
        create(:maintenance_plan, equipment_type: equipment_type, name: 'PM 500', cost: 200_000, interval: 500)
        create(:maintenance_plan, equipment_type: equipment_type, name: 'PM 1000', cost: 1_000_000, interval: 1000)
        create(:maintenance_plan, equipment_type: equipment_type, name: 'PM 2000', cost: 2_000_000, interval: 2000)
      end
    end
  end
end
