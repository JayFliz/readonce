require 'spec_helper'

describe "Messages" do
  
  describe "POST /messages" do
    before do
      post messages_path, message: { body: 'Test' }
      
    end
    
    it "creates a message" do
      
      Message.first.body.should eq 'Test'
      
    end
    
    it "redirects to /messages" do
      
      response.status.should eq 302
      response.location.should eq messages_url
      
      
    end
    
    
  end
  
  describe "creating a message", type: :feature do
    it "redirect to the messages index" do
      # capybara methods
      visit new_message_path 
      fill_in :message_body, with: 'Test'
      click_button 'Send'
      page.should have_content 'Test'
      
    end
  end
end
