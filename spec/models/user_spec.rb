require 'spec_helper'

describe User do
  it { should have_many :authentications }

  let(:user) { Factory :user }

  context "authentications" do

    it "should return the provider" do
      auth     = Factory :authentication, user: user
      provider = auth.provider

      user.auth_provider(provider).should be_valid
    end

    it "should return the token" do
      auth     = Factory :authentication, user: user
      provider = auth.provider

      user.auth_provider(provider).token.should be_present
    end

    it "should check if provider was authorized" do
      auth     = Factory :authentication, user: user
      provider = auth.provider

      user.auth_provider?(provider).should == true
      user.auth_provider?(provider.reverse).should == false
    end

  end

end

