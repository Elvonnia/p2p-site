class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		existing_user = User.find_by(user_params)
		if existing_user
			redirect_to root_path, flash[:notice] =  {username: ["Already exist"]}
		else
			if user.save
				session[:user_id] = user.id
      			redirect_to chatrooms_path
      		else
      			redirect_to root_path, flash[:notice] =  user.errors.messages
      		end
		end
	end

	private

    def user_params
		return params.require(:user).permit(:username)
    end
end