require 'spec_helper'

describe Message do
  
  it { should validate_presence_of :body } # from shoulda-matchers gem
  it {should belong_to :sender }
  
  it {should belong_to :receiver }
  it { should validate_presence_of :receiver_id }
  
  
end
