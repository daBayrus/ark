class AuthenticationsController < ApplicationController

  def create
    handle_auth Authentication.extract_auth_info(env["omniauth.auth"])
  end

protected

  def handle_auth(auth_hash)
    auth = Authentication.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if user_signed_in?
      if auth.nil?
        Authentication.connect_user_with_provider(current_user, auth_hash)
        flash[:notice] = "You can now login using your #{auth_hash[:provider].capitalize} account."
      end

    else
      if auth.nil?
        user = Authentication.create_user(auth_hash)
      else
        user = auth.user
      end

      self.current_user = user

    end

  end

end
