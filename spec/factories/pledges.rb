# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
    amount  5
    status  'active'

    association :project
  end

  factory :new_pledge, :class => Pledge do
    amount  5
    status  'new'

    association :project
  end

  factory :active_pledge, :class => Pledge do
    amount  5
    status  'active'

    association :project
  end

  factory :collected_pledge, :class => Pledge do
    amount  5
    status  'collected'

    association :project
  end

  factory :minimum_pledge, :class => Pledge do
    amount  2
    status  'active'

    association :project
  end

end# == Schema Information
#
# Table name: pledges
#
#  id         :integer(4)      not null, primary key
#  amount     :float
#  user_id    :integer(4)
#  project_id :integer(4)
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

