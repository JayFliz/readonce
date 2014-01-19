class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  
  validates :body, presence: true # , inclusion: {format: /\AHello.*Bye$\Z/ }
  validates :receiver_id, presence: true
  
end
