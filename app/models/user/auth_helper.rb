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

end
