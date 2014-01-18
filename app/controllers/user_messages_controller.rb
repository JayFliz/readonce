class UserMessagesController < ApplicationController
  
  def create
    
    Message.create message_params
    redirect_to root_url # use root url because http spec says redirect has to include full url. use root_path in views
    
  end
  
  def message_params
    
    #whitelist
    
    params[:message].permit :body
    
  end
  
end
