class EntriesController < ApplicationController
  before_filter :authenticate_user! #, :except => [:index, :show]

  def index
    @entries = Entry.order_by([:created_at, :desc]).all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.build(params[:entry])
    @entry.save
    redirect_to @entry
  end
  
  def update
    @entry = current_user.entries.find(params[:id])
    @entry.update_attributes(params[:entry])
    redirect_to @entry
  end
  
  def destroy
    current_user.entries.find(params[:id]).destroy
    redirect_to entries_path
  end
  
end
