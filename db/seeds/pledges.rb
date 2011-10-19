
Project.all.each do |project|

  random_users.each do |user|
    Pledge.create :user => user, :project => project, :amount => (rand(100) + 1)
  end

end
