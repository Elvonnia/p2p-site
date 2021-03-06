class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = User.find(session[:user_id])
    message.text = message.user.username + " : " + message.text
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.text,
        user: message.user.username,
        chatroom_id: message.chatroom_id
      head :ok
    end
  end

  private

  def message_params
      params.require(:message).permit(:text, :chatroom_id)
   end
end