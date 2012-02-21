class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable

  field :name, :type => String

  has_many :entries
  
  def to_s; email end
  
  def like(entry); entry.likes.create(:user => self) end
  def dislike(entry); entry.likes.where(:user_id => self.id).destroy_all end
  def likes?(entry); !!entry.likes.where(:user_id => self.id).first end

  include Streama::Actor

  def followers
      User.excludes(:id => self.id).all
  end      

  # for Twitter authentication

  field :twitter_id, :type => String
  field :twitter_name, :type => String
  field :twitter_screen_name, :type => String
  field :twitter_profile_image_url, :type => String
  
  def self.find_or_create_for_twitter(response)
    data = response['extra']['raw_info']
    if user = User.where(:twitter_id => data["id"]).first
      user
    else # Create a user with a stub password.
      user = User.new(
        :email => "twitter+#{data["id"]}@foobar.com",
        :password => Devise.friendly_token[0, 20],
        :twitter_id => data["id"],
        :twitter_name => data["name"],
        :twitter_screen_name => data["screen_name"],
        :twitter_profile_image_url => data["profile_image_url"]
      )
      user.confirm!
      user
    end    
  end

  def display_name
    if twitter_id
      "#{twitter_name}(@#{twitter_screen_name})"
    else
      email
    end
  end      
  
  def to_s; display_name end

  def profile_image
    twitter_profile_image_url || "default-avatar.png"
  end
  
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
