class RoomsChannel < ApplicationCable::Cable
	def subscribed
		stream_from 'messages'
	end
end