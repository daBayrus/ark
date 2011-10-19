# == Schema Information
#
# Table name: authentications
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  provider   :string(255)
#  token      :string(255)
#  uid        :string(255)
#  name       :string(255)
#  email      :string(255)
#  avatar_url :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Authentication < ActiveRecord::Base
  belongs_to :user

  validates :user,     :presence => true
  validates :uid,      :presence => true, :uniqueness => { :scope => :provider }
  validates :email,    :presence => true
  validates :provider, :presence => true
  validates :token,    :presence => true

  class << self

    def providers
      %w(facebook twitter)
    end

    def extract_auth_info(auth)
      auth_hash = {}

      case auth["provider"].to_s.downcase
      when "facebook"
        auth_hash[:provider] = auth["provider"]
        auth_hash[:email]    = auth["extra"]["user_hash"]["email"]    rescue nil
        auth_hash[:uid]      = auth["extra"]["user_hash"]["id"]       rescue nil
        auth_hash[:token]    = auth["credentials"]["token"]           rescue nil

        # Extra info not needed for auth but for populating profile
        auth_hash[:name]       = auth["extra"]["user_hash"]["name"]  rescue nil
        auth_hash[:avatar_url] = Facebook.image_url(auth_hash[:uid]) rescue nil
        auth_hash[:location]   = auth["extra"]["user_hash"]["location"] rescue nil

      else
        raise "Unsupported auth provider"
      end

      auth_hash 
    end

    def connect_user_with_provider(user, auth_hash)
      user.authentications.create! auth_hash
    end

    def create_user(auth_hash)
      user = User.create! 
      connect_user_with_provider user, auth_hash
      user
    end

  end # class methods

end
