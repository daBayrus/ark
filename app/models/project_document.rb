class ProjectDocument < ActiveRecord::Base
  
  belongs_to :project
  
  mount_uploader :document, ProjectDocumentUploader
  
end
