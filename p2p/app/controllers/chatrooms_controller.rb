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

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatroom = Chatroom.includes(:messages).find_by!(id: params[:id])
    @message = Message.new
  end

  def delete
  chatroom = Chatroom.find(:id)
  chatroom.destroy
  #Use this action depending on the delete event
  #redirect_to sessions_path, flash[:notice] = { chatroom: [" The chatroom has been removed"]} 
  

  private

    def chatroom_params
      params.require(:chatroom).permit(:name)
    end
end
