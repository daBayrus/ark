class User < ActiveRecord::Base
  include User::AuthHelper

  has_many :pledges
  has_many :projects
end

