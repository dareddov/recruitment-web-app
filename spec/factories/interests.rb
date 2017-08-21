FactoryGirl.define do
  factory :interest do
    sequence(:name) { |n| "Interest #{n}"}
    interest_type { Interest.interest_types.keys.sample.to_sym }
  end
end
