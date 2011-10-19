user = User.first

Project.create! :name => "project1", :description => "description", :cost => 123, :deadline => 30.days.from_now 
Project.create! :name => "project2", :description => "description", :cost => 456, :deadline => 15.days.from_now
Project.create! :name => "project3", :description => "description", :cost => 789, :deadline => 5.days.from_now
