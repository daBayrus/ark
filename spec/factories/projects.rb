# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :project do
    name  'Project Name'
    deadline  Date.today + 25
    funding_required  125
    video_link 'http://example.com'

    association :user
  end
  
end# == Schema Information
#
# Table name: projects
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  deadline    :date
#  cost        :float
#  description :text
#  video_link  :text
#  status      :string(255)
#  user_id     :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

