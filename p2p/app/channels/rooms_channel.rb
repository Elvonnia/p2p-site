class RoomsChannel < ApplicationCable::Cable
	def subscribed
		stream_from 'rooms'
	end
end