class Pledge < ActiveRecord::Base
  
  ACTIVE_STATES = ["active", "collected"]
  MINIMUM_AMOUNT = 2

  include Workflow
  workflow_column :status
  
  belongs_to :project
  belongs_to :user

  validates :project, :presence => true
  validates :user,    :presence => true
  validates :amount,  :numericality => { :greater_than_or_equal_to => 1 }

  attr_accessible :amount
  
  workflow do
    state :active    # not yet collected
    state :collected # charged pledge
    state :cancelled
  end
  

  default_scope order("created_at DESC")
  scope :active, where("status in (?)", ACTIVE_STATES)
  
end

