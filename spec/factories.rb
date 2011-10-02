FactoryGirl.define do

  factory :user do
  end

  factory :authentication do
    email    { Faker::Internet.email }
    provider { Faker::Internet.domain_word }
    uid      "1234"
    token    "5678"

    association :user
  end
  
end
