class Project < ActiveRecord::Base
  
  include Workflow
  workflow_column :status
  
  belongs_to :user
  has_many :project_images, :dependent => :destroy
  has_many :project_videos, :dependent => :destroy
  has_many :project_documents, :dependent => :destroy
  has_many :pledges, :dependent => :destroy

  validates :name, :presence => true
  validates :deadline, :presence => true

  scope :active_pledges, lambda {
    joins(:pledges).
    where("pledges.status in (?)", "'active', 'collected'")
  }
  
  workflow do
    state :new do
      event :mark_incomplete, :transitions_to => :incomplete
      event :mark_ongoing, :transitions_to => :ongoing
      
      #TODO: recurring check for 30 days
    end
    
    #project has no video presentation OR no image OR no attachment after 30 days
    state :incomplete do
      event :mark_ongoing, :transitions_to => :ongoing
    end
    
    #project has not reached deadline, still open for funding
    state :ongoing do 
      event :undeliver, :transitions_to => :undelivered
      event :fulfill, :transitions_to => :fulfilled
      
      #TODO: recurring check for deadline
    end
    
    #project has reached deadline but with < 100% funding
    state :undelivered
    
    #project has reached deadline and with funding >= 100%
    state :fulfilled 
  end
  
  def funds
    pledges.reject{|x| !Pledge::ACTIVE_STATES.include?(x.status) }.collect(&:amount).sum
  end
  
  def has_funding?
    funds > 0
  end

  protected

    #TODO: review_requirements method
    def review_requirements
    end
  
end
