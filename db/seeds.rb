def random_users
  count = User.count
  ids   = 1.upto(count).collect{ rand(count) + 1 }.uniq
  User.where(:id => ids)
end

plant :users
plant "projects"
plant "pledges"
