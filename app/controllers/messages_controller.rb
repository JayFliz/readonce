class MessagesController < ApplicationController
  before_action :authenticate_user! #devise method
  
  respond_to :html
  
  def index
    
  end
  
  def create
    # day 1
    #Message.create message_params
    #redirect_to messages_url # use _url because http spec says redirect has to include full url. use root_path in views
     
    #day 2
    
    # @message = Message.create(message_params) # removed to allow us to associate message to current devise user
    @message = current_user.messages.create(message_params)
    respond_with message, location: messages_url
    
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
  
  def messages
    
    @messages ||= current_user.messages
    
  end
  helper_method :messages
  
  
  def receivers 
    
    @receivers ||= User.all
    
  end
  helper_method :receivers
  
end

