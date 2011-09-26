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

  factory :new_pledge do
    amount  5
    status  'new'
    
    association :project
  end

  factory :active_pledge do
    amount  5
    status  'active'
    
    association :project
  end
  
  factory :collected_pledge do
    amount  5
    status  'collected'
    
    association :project
  end
  
end
