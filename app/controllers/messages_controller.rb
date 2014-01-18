class MessagesController < ApplicationController
  def index
    
  end
  
  def create
    
    Message.create message_params
    redirect_to user_messages_url # use _url because http spec says redirect has to include full url. use root_path in views
    
  end
  
  def new
    
  end
  
  def message_params
    
    #whitelist
    
    params[:message].permit :body
    
  end
  
  def message
    @message ||= Message.new #memoization
  end
  helper_method :message #expose it to the view
  
end
