class CommentsController < ApplicationController
  
  def create
    # raise params[:entry_id].inspect
    @entry = Entry.find(params[:entry_id])
    @comment = Comment.new(params[:comment])
    @entry.comments << @comment
    @entry.save
    redirect_to @entry
  end
  
end
