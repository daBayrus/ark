class Project < ActiveRecord::Base
  
  include Workflow
  
  has_many :project_images, :dependent => :destroy
  has_many :project_videos, :dependent => :destroy
  has_many :project_documents, :dependent => :destroy
  has_many :pledges, :dependent => :destroy
  belongs_to :status
  
  #TODO: complete workflow setup for project
  workflow do
    state :new
    state :incomplete #project has no video presentation OR no image OR no attachment
    state :ongoing #project has not reached deadline, still open for funding
    state :undelivered #project has reached deadline but with < 100% funding
    state :fulfilled #project has reached deadline and with funding >= 100%
  end
  
  #TODO: is_funded? method
  def is_funded?
  end
  
  #TODO: has_funding? method
  def has_funding?
  end
  
end
