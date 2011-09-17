class User < ActiveRecord::Base
  include User::AuthHelper
end
