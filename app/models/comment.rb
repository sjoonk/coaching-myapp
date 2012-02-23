class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, :type => String

  embedded_in :entry
  embeds_many :likes, :as => :likable
  belongs_to :user

  after_create :increment_count
  after_destroy :decrement_count

  protected

  def increment_count
    self.user.comments_count += 1
  end
  
  def decrement_count
    self.user.comments_count -=1
  end  
  
end
