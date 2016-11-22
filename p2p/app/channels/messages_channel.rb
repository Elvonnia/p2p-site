class MessagesChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'messages'
	end

	def unfollow
    	stop_all_streams
  	end
end