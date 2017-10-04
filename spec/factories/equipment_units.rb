FactoryGirl.define do
  factory :equipment_unit do
    sequence(:name) { |n| "Equipment Unit #{n}" }
    initial_hourmeter 3090
    monthly_usage 150
    equipment_type
  end
end
