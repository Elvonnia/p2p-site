class User < ApplicationRecord
	validates :username, presence:true, uniqueness:true
	belongs_to :chatroom, optional: true
	has_many :messages
end
