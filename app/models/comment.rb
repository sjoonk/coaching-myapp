class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, :type => String

  embedded_in :entry
  embeds_many :likes, :as => :likable
end
