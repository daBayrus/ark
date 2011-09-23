class Status < ActiveRecord::Base

  validates :name, :presence => true
  
end
