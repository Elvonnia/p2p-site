class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.text,
        user: message.user.username
      head :ok
    end
  end

  private

  def message_params
      params.require(:message).permit(:text, :chatroom_id)
   end
end