class Pledge < ActiveRecord::Base
  
  include Workflow

  #TODO: workflow setup
  workflow do
    state :new
    state :active #not yet charged
    state :collected #charged pledge
    state :cancelled
  end
  
end
