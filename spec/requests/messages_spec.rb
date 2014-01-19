require 'spec_helper'

describe "Messages" do
  
  describe "POST /messages" do
       
    describe "creating a message", type: :feature do # use describe for actions
      before do
        sign_up
            
      end
    
      it "redirects to the messages index" do
        # capybara methods
        
        visit new_message_path 
        fill_in :message_body, with: 'Test'
        click_button 'Send'
        page.should have_content 'Test'
        
      end
    
      context 'without filling in body field' do # use context for state
        it 'displays an error message' do
          visit new_message_path
          click_button 'Send'
          page.should have_content "can't be blank"
        end
      end 
      
    end
    
    describe 'viewing a list of messages',  type: :feature do
      before do
        another_user = create(:user, email: 'them@test.com')
        create(:message, sender: another_user, body: 'his message')
        sign_up
      end
      
      it "doesn't show others messages" do
        visit messages_path
        page.should_not have_content 'his message'
      end
    end
  end
  
  
  def sign_up
    visit new_user_registration_path 
    fill_in :user_email, with: 'Test@test.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button 'Sign up'  
  end
  
end
