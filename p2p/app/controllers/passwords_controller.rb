class PasswordsController < ApplicationController
	def create
		password = Password.new(password_params)
		chatroom = chatroom.find(params[:id])
		if password.password == chatroom.password
			@message = Message.new
		else
			redirect_to passwords_path
		end
	end

	def index
		@password = Password.new
		@passwords = Password.all
	end

	private

    def password_params
		params.require(:password).permit(:password)
    end
end