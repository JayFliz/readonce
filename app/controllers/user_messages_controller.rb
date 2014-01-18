class UserMessagesController < ApplicationController
  
  def create
    
    m = Message.new
    m.save
    redirect_to root_url # use root url because http spec says redirect has to include full url. use root_path in views
    
  end
  
  
end
