class Chatroom < ApplicationRecord
	validates :name, presence:true, uniqueness:true
	#has_many :storefiles
	has_many :messages
end
