class Authentication < ActiveRecord::Base
  belongs_to :user

  validates :user,     presence: true
  validates :uid,      presence: true
  validates :email,    presence: true
  validates :provider, presence: true
  validates :token,    presence: true

  class << self

    def providers
      %w(facebook twitter)
    end

    def extract_auth_info(auth)
      auth_hash = {}

      case auth["provider"].to_s.downcase
      when "facebook"
        auth_hash[:email]    = auth["extra"]["user_hash"]["email"]          rescue nil
        auth_hash[:uid]      = auth["extra"]["user_hash"]["id"]             rescue nil
        auth_hash[:provider] = auth["provider"]                             rescue nil
        auth_hash[:token]    = auth["credentials"]["token"]                 rescue nil

        # Extra info not needed for auth but for populating profile
        auth_hash[:name]      = auth["extra"]["user_hash"]["name"]          rescue nil
        auth_hash[:image_url] = Facebook.image_url(auth_hash[:uid], :large) rescue nil
      else
        raise "Unsupported auth provider"
      end

      auth_hash 
    end

    def connect_user_with_provider(auth_hash)
      authentications.create! auth_hash
    end

    def create_user(auth_hash)
      user = User.create! 
      user.authentications.create! auth_hash
      user
    end
    
  end # class methods

end
