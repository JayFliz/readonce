require 'spec_helper'

describe "UserMessages" do
  
  describe "POST /messages" do
    before do
      post messages_path, message: { body: 'Test' }
      
    end
    
    it "creates a message" do
      
      Message.first.body.should eq 'Test'
      
    end
    
    it "redirects to /user_messages" do
      
      response.status.should eq 302 # could remove this as the second test implies a redirect
      response.location.should eq user_messages_url
      
      
    end
    
    
  end
  
  describe "creating a message", type: :feature do
    it "redirect to the messages index" do
      # capybara methods
      visit new_message_path 
      fill_in :message_body, with: 'Test' #brittle, but hey, watcha gonna do??
      click_button 'Send'
      page.should have_content 'Test'
      
    end
  end
end
