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
<<<<<<< HEAD
    @chatroom = Chatroom.find_by!(chatroom_params)
=======
    @chatroom = Chatroom.find_by(params[:id])
>>>>>>> 2a43956a134094b6029baa9cb46d87c40327ee38
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
<<<<<<< HEAD
        flash[:notice] = {error: ["A chatroom with this name already exists"]}
        format.html { redirect_to new_chatroom_path }
=======
        flash[:notice] = {error: ["a chatroom with this name already exists"]}
        format.html { redirect_to chatrooms_path }
>>>>>>> 2a43956a134094b6029baa9cb46d87c40327ee38
        format.js { render template: 'chatrooms/chatroom_error.js.erb'} 
      end
    end
  end

  def update
<<<<<<< HEAD
    chatroom = Chatroom.find_by!(new_chatroom_path)
=======
    chatroom = Chatroom.find(params[:id])
>>>>>>> 2a43956a134094b6029baa9cb46d87c40327ee38
    chatroom.update(chatroom_params)
    redirect_to chatroom
  end

  def show
<<<<<<< HEAD
    @chatroom = Chatroom.find_by!(chatroom_params)
=======
    @chatroom = Chatroom.find(params[:id])
>>>>>>> 2a43956a134094b6029baa9cb46d87c40327ee38
    @message = Message.new
  end

  private

    def chatroom_params
      params.require(:chatroom).find_by!(:name)
    end
end
