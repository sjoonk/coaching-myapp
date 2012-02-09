class HomeController < ApplicationController
  def index
    # @entries = Entry.order_by([:created_at, :desc]).limit(3).all
    @entries = Entry.order_by([:created_at, :desc]).page(params[:page]).per(3)
  end

end
