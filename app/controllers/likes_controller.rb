class LikesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_entry

  def create
    current_user.like(@entry)
    redirect_to @entry
  end

  def destroy
    current_user.dislike(@entry)
    redirect_to @entry
  end
  
  private
  
  def find_entry
    @entry = Entry.find(params[:id])
  end

end
