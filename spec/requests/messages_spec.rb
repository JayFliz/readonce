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
      
<<<<<<< HEAD:spec/requests/user_messages_spec.rb
      response.status.should eq 302 # could remove this as the second test implies a redirect
      response.location.should eq user_messages_url
=======
      response.status.should eq 302
      response.location.should eq messages_url
>>>>>>> user-creates-a-message:spec/requests/messages_spec.rb
      
      
    end
    
    
  end
  
  describe "creating a message", type: :feature do
    it "redirect to the messages index" do
      # capybara methods
      visit new_message_path 
<<<<<<< HEAD:spec/requests/user_messages_spec.rb
      fill_in :message_body, with: 'Test' #brittle, but hey, watcha gonna do??
=======
      fill_in :message_body, with: 'Test'
>>>>>>> user-creates-a-message:spec/requests/messages_spec.rb
      click_button 'Send'
      page.should have_content 'Test'
      
    end
  end
end
