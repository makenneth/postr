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
#  admin           :boolean          default("f")
#  super_admin     :boolean          default("f")
#

class User < ActiveRecord::Base
  after_initialize :ensure_session_token
  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  has_many :moderator_subs,
   foreign_key: :moderator_id,
   primary_key: :id,
   class_name: :ModeratorSub

   has_many :subs,
      through: :moderator_subs,
      source: :sub

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user.is_password?(password)
      return user
    else
    end
  end

  def reset_session_token!
     self.session_token = SecureRandom.urlsafe_base64
     self.save
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_super_admin?
     self.super_admin
  end

  def is_admin?
     self.admin
  end

  def is_moderator?

  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
