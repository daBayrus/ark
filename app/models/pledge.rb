class Pledge < ActiveRecord::Base
  
  ACTIVE_STATES = ["active", "collected"]

  include Workflow
  workflow_column :status
  
  belongs_to :project
  belongs_to :user
  
  validates :amount, :numericality => {:greater_than_or_equal_to => 2}
  
  workflow do
    state :new
    state :active #not yet charged
    state :collected #charged pledge
    state :cancelled
  end
  
end
