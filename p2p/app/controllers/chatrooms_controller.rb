class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
  end

  #def new
    #if request.referrer.split("/").last == "chatrooms"
      #flash[:notice] = nil
    #end
    #@chatroom = Chatroom.new
  #end

  def edit
    @chatroom = Chatroom.find_by(params[:id])
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
        format.html { redirect_to chatrooms_path }
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
    @message = Message.new
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:name)
    end
end