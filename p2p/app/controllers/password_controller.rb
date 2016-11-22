class PasswordController < ApplicationController
	def create
		password = Password.new(message_params)
		message.user = User.find(session[:user_id])
		if message.save
			ActionCable.server.broadcast 'messages',
			message: message.text,
			user: message.user.username,
			chatroom_id: message.chatroom_id
			head :ok
		end
	end

	private

    def password_params
		params.require(:password).permit(:password)
    end
end