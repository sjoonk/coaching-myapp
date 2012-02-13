class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, :type => String
  field :body, :type => String

  belongs_to :user
  embeds_many :comments
  mount_uploader :photo, PhotoUploader

  field :category, :type => String
  CATEGORIES = %w(apple banana graph kiwi orange)

  field :tags, :type => Array

  def self.tagged_with(tag)
    self.any_in(:tags => [tag])
  end

  embeds_many :likes, :as => :likable
end
