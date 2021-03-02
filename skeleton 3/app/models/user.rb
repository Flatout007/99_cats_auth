# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  # creates a new session token via SecureRandom
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }

  attr_reader :password

  has_many :cats,
  foreign_key: :user_id,
  class_name: 'Cats'
  after_initialize :ensure_session_token
  
  def ensure_session_token
    self.session_token = SecureRandom::urlsafe_base64

  end

  def reset_session_token!()
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  #assigns and returns a hashed password via Bcrypt
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)

    @password = password
  end

  #checks if password_digest is correct via BCrypt
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)

    if user && user.is_password?(password)
      user
    else
      nil
    end
  end
end
