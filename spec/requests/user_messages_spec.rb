require 'spec_helper'

describe "UserMessages" do
  
  describe "POST /user_messages" do
    it "creates a message" do
      
      post user_messages_path
      Message.count.should == 1
      
    end
  end
  
end
