class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, :type => String
  field :body, :type => String

  belongs_to :user
  embeds_many :comments
  mount_uploader :photo, PhotoUploader
end
