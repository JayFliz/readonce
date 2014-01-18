require 'spec_helper'

describe "UserMessages" do
  
  describe "POST /user_messages" do
    before do
      post user_messages_path, message: { body: 'Test' }
      
    end
    
    it "creates a message" do
      
      Message.first.body.should eq 'Test'
      
    end
    
    it "redirects to /user_messages" do
      
      response.status.should eq 302
      response.location.should eq user_messages_url
      
      
    end
    
    
  end
  
  describe "creating a message", type: :feature do
    it "redirect to the messages index" do
      # capybara methods
      visit new_user_message_path 
      fill_in :message_body, with: 'Test'
      click_button 'Send'
      page.should have_content 'Test'
      
    end
  end
end
