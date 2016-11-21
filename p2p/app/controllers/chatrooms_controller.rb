class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
  end

  def new
    if request.referrer.split("/").last == "chatrooms"
      flash[:notice] = nil
    end
    @chatroom = Chatroom.new
  end

  def edit
    @chatroom = Chatroom.find_by(chatroom_params)
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
        flash[:notice] = {error: ["a chatroom with this name already exists"]}
        format.html { redirect_to new_chatroom_path }
        format.js { render template: 'chatrooms/chatroom_error.js.erb'} 
      end
    end
  end

  def update
    chatroom = Chatroom.find_by(new_chatroom_path)
    chatroom.update(chatroom_params)
    redirect_to chatroom
  end

  def show
    @chatroom = Chatroom.find_by(chatroom_params)
    @message = Message.new
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:name)
    end
end