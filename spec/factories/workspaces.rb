FactoryGirl.define do
  factory :workspace do
    sequence(:name) { |n| "Workspace #{n}" }
    default_monthly_usage 500
  end
end
