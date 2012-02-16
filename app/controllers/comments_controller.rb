class CommentsController < ApplicationController
  
  def create
    # raise params[:entry_id].inspect
    @entry = Entry.find(params[:entry_id])
    @comment = Comment.new(params[:comment])
    @entry.comments << @comment
    @entry.save
    respond_to do |format|
      format.html { redirect_to @entry }
      format.js
    end
  end

  def destroy
    @entry = Entry.find(params[:entry_id])
    @entry.comments.find(params[:id]).destroy
    if request.xhr?
      head :ok
    else  
      redirect_to @entry
    end  
  end
  
end
