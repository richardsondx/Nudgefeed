class User < ActiveRecord::Base
  has_many :posts
  has_many :topics
  has_many :nudges

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.firstname        = auth.info.first_name
      user.lastname         = auth.info.last_name
      user.fullname         = auth.info.name
      user.email            = auth.info.email
      # user.friends          = 

      user.provider         = auth.provider
      user.uid              = auth.uid
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end