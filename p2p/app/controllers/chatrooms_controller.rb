class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
  end

  def edit
    @chatroom = Chatroom.find_by(params[:user_id])
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      respond_to do |format|
        format.html { redirect_to @chatroom }
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = {error: ["A chatroom with this name already exists"]}
        format.html { redirect_to new_chatroom_path }

        format.js { render template: 'chatrooms/chatroom_error.js.erb'} 
      end
    end
  end

  def update
    chatroom = Chatroom.find(params[:id])
    chatroom.update(chatroom_params)
    redirect_to chatroom
  end

  def show(password = "")
    @chatroom = Chatroom.find(params[:id])
    puts(@chatroom)
    # @chatroom = Chatroom.includes(:messages).find_by!(id: params[:id])
    if @chatroom.password != ""
      if password == @chatroom.password
        @message = Message.new
      else
        redirect_to chatrooms_path
      end
    else
      @message = Message.new
    end
  end

  # def show
  #   @chatroom = Chatroom.find(params[:id])
  #   puts("\n\n\n\n\n\n#{@chatroom}")
  #   @message = Message.new()
  # end

  def delete
  chatroom = Chatroom.find(:id)
  chatroom.destroy
  #Use this action depending on the delete event
  #redirect_to sessions_path, flash[:notice] = { chatroom: [" The chatroom has been removed"]} 
  end

  def auth
    puts("\n\n\n GROSSE BITE SA MERE \n\n\n")
    self.show(password_params[:password])
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:name, :password)
    end
end
