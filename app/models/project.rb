class Project < ActiveRecord::Base
  
  has_many :project_images, :dependent => :destroy
    
end
