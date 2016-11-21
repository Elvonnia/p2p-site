class Message < ApplicationRecord
	validates :username, presence:false, uniqueness:true
	belongs_to :chatroom, dependent: :destroy
	belongs_to :user, dependent: :destroy
end
