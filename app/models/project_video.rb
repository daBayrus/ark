class ProjectVideo < ActiveRecord::Base
  
  belongs_to :project
  
  has_attached_file :video, :styles => { :small => "150x150>", :large => "320x240>" }  
  
end
