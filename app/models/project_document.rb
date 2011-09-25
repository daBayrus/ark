class ProjectDocument < ActiveRecord::Base
  
  belongs_to :project
  
  has_attached_file :document  
  
end
