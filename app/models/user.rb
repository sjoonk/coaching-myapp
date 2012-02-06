class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  field :name, :type => String

  # 
  # field :email, :type => String
  # field :password_salt, :type => String
  # field :password_hash, :type => String
  # 
  # attr_accessor :password  
  # validates_confirmation_of :password
  # validates_presence_of :password, :on => :create  
  # validates_presence_of :email  
  # validates_uniqueness_of :email  
  # 
  # before_save :encrypt_password
  # 
  # def encrypt_password  
  #   if password.present?  
  #     self.password_salt = BCrypt::Engine.generate_salt  
  #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
  #   end  
  # end
  # 
  # def self.authenticate(email, password)  
  #   # user = find_by_email(email)  
  #   user = User.where(:email => email).first
  #   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  #     user  
  #   else  
  #     nil  
  #   end  
  # end
    
end