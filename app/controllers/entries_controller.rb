class EntriesController < ApplicationController
  before_filter :authenticate_user! #, :except => [:index, :show]

  # GET /entries?cate=apple
  def index
    @entries = Entry
    @entries = @entries.where(:category => params[:cate]) if params[:cate]
    @entries = @entries.order_by([:created_at, :desc]).page(params[:page]).per(3) 

    respond_to do |format|
      format.html {
        render @entries if request.xhr?
      }
      format.js
      format.json { render :json => @entries }
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def tag
    @entries = Entry.tagged_with(params[:tag])
    render "index"
  end

  def create
    @entry = current_user.entries.build(params[:entry])
    @entry.tags = params[:tags].split(',').map { |t| t.strip } if params[:tags]
    @entry.save
    current_user.publish_activity(:new_entry, :object => @entry)
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
