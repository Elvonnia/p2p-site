class User < ApplicationRecord
	validates:username, presence:true, uniqueness:true
	belongs_to :chatroom
	has_many:messages
end
