require 'spec_helper'

describe Authentication do

  it { should belong_to :user }
  it { should validate_presence_of :user }
  it { should validate_presence_of :uid }
  it { should validate_presence_of :email }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :token }

  subject { Factory :authentication }
  it { should validate_uniqueness_of(:uid).scoped_to(:provider) }

  let(:user) { Factory :user }

  def auth_hash_factory(provider)
    { facebook: {
        provider: "facebook",
        email:    "u1@facebook.com",
        uid:      "1234",
        token:    "5678",
      },
      twitter: {
        provider: "twitter",
        email:    "u1@twitter.com",
        uid:      "abcd",
        token:    "efgh",
      }
    }[provider.to_sym]
  end

  %w(facebook twitter).each do |provider|

    it "should create user from auth" do
      auth = auth_hash_factory(provider)
      user = Authentication.create_user auth

      user.should be_valid
      user.auth_provider(provider).email.should == auth[:email]
    end

    it "should connect existing user with auth" do
      auth = Authentication.connect_user_with_provider user, auth_hash_factory(provider)

      auth.should be_valid
      auth.email.should == auth_hash_factory(provider)[:email]
    end

  end


end
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

