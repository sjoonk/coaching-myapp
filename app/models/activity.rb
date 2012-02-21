class Activity
  include Streama::Activity

  activity :new_entry do
    actor :user, :cache => [:email]
    object :entry, :cache => [:title, :body]
    # target_object :album, :cache => [:title]
  end
  
  activity :new_comment do
    actor :user, :cache => [:email]
    object :comment, :cache => [:body]
    # target_object :album, :cache => [:title]
  end
  
  activity :like do
    actor :user, :cache => [:email]
    object :like #, :cache => [:title, :body]
    # target_object :album, :cache => [:title]
  end
  

end