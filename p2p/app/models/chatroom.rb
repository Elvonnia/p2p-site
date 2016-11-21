class Chatroom < ApplicationRecord
	validates :id, presence:false, uniqueness:true
	validates :name, presence:true, uniqueness:true
	#has_many :storefiles
	has_many :messages
end
