class Like
  include Mongoid::Document
  include Mongoid::Timestamps

  # embedded_in :entry
  embedded_in :likable, :polymorphic => true
  belongs_to :user

  validates_uniqueness_of :user_id
end
