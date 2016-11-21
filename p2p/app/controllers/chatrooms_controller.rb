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
    @chatroom = Chatroom.find_by(slug: params[:slug])
  end

  def create
    @chatroom = Chatroom.new()
    if chatroom.save
      respond_to do |format|
        format.html {redirect to @chatroom}
      end
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end