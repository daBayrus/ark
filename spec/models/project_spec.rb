require 'spec_helper'

describe Project do

  let(:pledge) { Factory :pledge }  
  let(:project) { Factory :project }  
  let(:user) { Factory :user }
  
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :deadline }
  it { should have_many :project_images }
  it { should have_many :project_documents }  
  it { should have_many :pledges }
    
  describe "return amount of funds" do
    it "returns 0 for all non active pledges" do      
      project.funds.eql?(0)
    end
  end
  
  describe "has_funding? requires funds to have an amount of at least 2" do
    let(:minimum_pledge) { Factory :minimum_pledge }
    
    it "returns false for projects with funds of amount less than 2" do
      project.pledges << minimum_pledge
      project.save!
      
      project.has_funding?.should == false
    end

    it "returns true for projects with funds of amount greater than 2" do
      project.pledges << pledge
      project.save!
      
      project.has_funding?.should == true
    end
  end
  
  describe "funding_percentage computes amount of funding covered against funding required" do
    
    it "returns 100% if funds == funding_required" do
      25.times do |x|
        project.pledges << pledge
      end
      project.funding_percentage.should == 100
    end
    
    it "returns 48% if funds == 60" do
      12.times do |x|
        project.pledges << pledge
      end
      
      project.funding_percentage.should == 48
    end    
  end
  
  describe "review_new_requirements will mark project as incomplete / ongoing depending on whether it has a video link after 30 days from date of creation" do
    
    it "returns 'incomplete' if project has no video after 30 days from date of creation" do
      project.created_at = Date.today - 30.days
      project.video_link = nil
      project.status = 'new'
      project.save
      
      project.review_new_requirements
      project.status.should == 'incomplete'
    end

    it "returns 'ongoing' if project has completed after 30 days from date of creation" do
      project.created_at = Date.today - 30.days
      project.video_link = 'http://example.com'
      project.status = 'new'
      project.save
      
      project.review_new_requirements
      project.status.should == 'ongoing'
    end    
  end
  
  describe "review_requirements will progress a project according to fulfilled or undelivered according to funds and deadline" do
    
    it "returns 'undelivered' if project reaches deadline with 0 funds" do
      project.deadline = Date.today
      project.pledges = []
      
      project.review_requirements
      project.status.should == 'undelivered'
    end
    
    it "returns 'undelivered' if project reaches deadline, has funds but is less than funding required" do
      project.deadline = Date.today
      2.times do |x|
        project.pledges << pledge
      end
      
      project.review_requirements
      project.status.should == 'undelivered'
    end
    
    it "returns 'fulfilled' if project reaches deadline, has funds and has 100% funding" do
      project.deadline = Date.today
      25.times do |x|
        project.pledges << pledge
      end
      
      project.review_requirements
      project.status.should == 'fulfilled'
    end

    it "returns 'fulfilled' if project reaches deadline, has funds and has > 100% funding" do
      project.deadline = Date.today
      30.times do |x|
        project.pledges << pledge
      end
      
      project.review_requirements
      project.status.should == 'fulfilled'
    end
    
  end
  
end
# == Schema Information
#
# Table name: projects
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  deadline    :date
#  cost        :float
#  description :text
#  video_link  :text
#  status      :string(255)
#  user_id     :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

