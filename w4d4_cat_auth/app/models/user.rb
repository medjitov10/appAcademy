# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :user_name, :password_digest, presence: true
  validate :password_digest_not_blank
  validates :session_token, presence: true, uniqueness: true

  attr_reader :password

  has_many :cats

  def self.find_by_credentials(user_name, password_digest)
    user = User.find_by(user_name: user_name)
    return user if user.is_password?(password)
    nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    self.password_digest
  end

  def is_password?(password)
    self.password_digest == BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def password_digest_not_blank
    if password_digest.empty?
      raise 'Password can\'t be blank'
    end
  end
end
