module User::AuthHelper
  extend ActiveSupport::Concern

  included do
     has_many :authentications, dependent: :destroy
  end

  def auth_token(provider)
    auth_provider(provider).token rescue nil
  end

  def auth_provider?(provider)
    authentications.where(provider: provider).any?
  end

  def auth_provider(provider)
    authentications.where(provider: provider).first
  end


  # TODO: Later, ask the user to select profile to use
  def name
    authentications.first.name
  end

  def location
    authentications.first.location
  end

  # type: square(50x50), small(50x), normal(100x), large(200x)
  def avatar_url(type = :small)
    "#{authentications.first.avatar_url}?type=#{type}"
  end

end
