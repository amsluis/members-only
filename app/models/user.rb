class User < ApplicationRecord
  has_secure_password
  after_create :remember
  attr_accessor :remember_token

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def remember
    create_remember_token
    digest = Digest::SHA1.hexdigest(self.remember_token)
    update_attribute(:remember_digest, digest)
  end
end
