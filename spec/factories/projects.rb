# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :project do
    name  'Project Name'
    deadline  Date.today + 25
    funding_required  125
    video_link 'http://example.com'

    association :user
  end
  
end