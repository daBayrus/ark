class Project < ActiveRecord::Base
  
  include Workflow
  workflow_column :status
  
  belongs_to :user
  has_many :project_images, :dependent => :destroy
  has_many :project_documents, :dependent => :destroy
  has_many :pledges, :dependent => :destroy

  validates :name, :presence => true
  validates :deadline, :presence => true

  after_create :review_new_requirements
  after_update :review_requirements
  
  scope :active_pledges, lambda {
    joins(:pledges).
    where("pledges.status in (?)", "'active', 'collected'")
  }
  
  workflow do
    state :new do
      event :mark_incomplete, :transitions_to => :incomplete
      event :mark_ongoing, :transitions_to => :ongoing      
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
  
  searchable do
    text :name, :description, :video_link, :stored => true
    string :name
    date  :deadline    
    integer :user_id
    string  :status
    float :funding_required
    float :funding_percentage, :using => :funding_percentage
    time :created_at

    string :sort_name do
      name.downcase if name = self.name
    end
    
    string :sort_status do
      status.downcase if status = self.status
    end
    
    float :sort_funding_required do
      funding_required.to_f
    end
  end  
  
  #sums only amount of active pledges
  def funds
    pledges.reject{|x| !Pledge::ACTIVE_STATES.include?(x.status) }.collect(&:amount).sum
  end

  #computes percentage of funds acquired against funding required
  def funding_percentage
    funds / funding_required * 100
  end
  
  #determines if project has started receiving funds
  def has_funding?
    funds > 2
  end

  #inspect requirements moves the project to incomplete or ongoing after 30 days
  def review_new_requirements
    if new?
      ((Date.today - created_at.to_date).to_int >= 30 and video_link.blank?) ? mark_incomplete! : mark_ongoing!
    end
  end
  handle_asynchronously :review_new_requirements, :run_at => Proc.new { 30.days.from_now } unless Rails.env.test?
  
  def review_requirements
    if incomplete?
      mark_ongoing! if !video_link.blank?
    end
    
    if ongoing?
      undeliver! if ((Date.today >= deadline) and (funding_percentage < 100))
      fulfill! if ((Date.today >= deadline) and (funding_percentage >= 100))
    end
  end
      
end
