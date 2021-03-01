class User < ApplicationRecord
    # creates a new session token via SecureRandom
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
    end
end
