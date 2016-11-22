class Message < ApplicationRecord
	#validates :username, presence:false, uniqueness:true
	belongs_to :chatroom, dependent: :destroy, optional: true
	belongs_to :user, dependent: :destroy, optional: true
end
