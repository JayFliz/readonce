require 'spec_helper'

describe Message do
  
  it { should validate_presence_of :body } # from shoulda-matchers gem
  it {should belong_to :sender }
  
end
