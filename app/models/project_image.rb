class ProjectImage < ActiveRecord::Base
  
  belongs_to :project
  
  has_attached_file :photo, :styles => { :small => "150x150>", :large => "320x240>" }
    
end
