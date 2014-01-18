require 'spec_helper'

describe "UserMessages" do
  
  describe "POST /user_messages" do
    it "creates a message" do
      
      post user_messages_path, message: { body: 'Test' }
      Message.first.body.should eq 'Test'
      
    end
  end
  
end
