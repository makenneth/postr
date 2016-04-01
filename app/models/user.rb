# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password, length: {minimum: 5, allow_nil: true}
  
  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user.is_password?(password)
      return user
    else
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
