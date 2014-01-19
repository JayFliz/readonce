# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    body "my message"
    receiver { build_stubbed(:user) }
  end
end
