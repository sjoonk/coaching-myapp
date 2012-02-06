class EntriesController < ApplicationController

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
    # raise params.inspect
    @entry = Entry.create(params[:entry])
    redirect_to @entry
  end
  
end
