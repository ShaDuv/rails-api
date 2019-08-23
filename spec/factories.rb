FactoryBot.define do
  factory :park do
    name { Faker::Books::Lovecraft }
    address { Faker::Address.street_address}
    city { Faker::Address.city }
    state
  end

  factory :state do
    name { Faker::Address.state }

    factory :state_with_parks do
      transient do
        parks_count { 12 }
      end

      after(:create) do |state, evaluator|
        create_list(:park, evaluator.parks_count, state: state)
      end
    end
  end
end
