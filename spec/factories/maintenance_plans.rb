FactoryGirl.define do
  factory :maintenance_plan do
    sequence(:name) { |n| "Maintenance Plan #{n}" }
    cost 100_000
    interval 250
    equipment_type
  end
end
