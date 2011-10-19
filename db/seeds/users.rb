1.upto(10) do |i|
  user = User.create!

  user.authentications.create! :uid => rand(100), :email => "user#{i}@localhost", 
    :provider => "facebook", :token => rand(100), :name => "user#{i}",
    :location => "city #{i}"

end
