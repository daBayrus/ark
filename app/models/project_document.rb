class ProjectDocument < ActiveRecord::Base
  
  belongs_to :project
  
  mount_uploader :document, ProjectDocumentUploader
  
end
# == Schema Information
#
# Table name: project_documents
#
#  id         :integer(4)      not null, primary key
#  document   :string(255)
#  project_id :integer(4)
#

