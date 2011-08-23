class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  
  validates(:name, :presence => true,
	          :uniqueness => { :case_sensitive => false })
  
  validates( :password, :presence => true,
	   	       :confirmation => true,
             :length => { :within => 6..20 }) 

  

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  class << self
    def authenticate(name, submitted_password)
      user = find_by_name(name)
      if user && user.password_hash == BCrypt::Engine.hash_secret(submitted_password, user.password_salt)
        user
      else
        nil
      end
    end

    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end
  
  
  
end