require 'spec_helper'

describe Project do

  let(:user) { Factory :user }
  let(:project) { Factory :project }  
  let(:new_pledge) { Factory :new_pledge }
  
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :deadline }
    
  describe "return amount of funds" do
    it "returns 0 for all non active pledges" do      
      project.funds.eql?(0)
    end
  end
  
  pending "returns true for has_funding? if funds > 2"
end
