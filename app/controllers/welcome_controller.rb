class WelcomeController < ApplicationController

  def hello
    @time = Time.now
  end
  
end
