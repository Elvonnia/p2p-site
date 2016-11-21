class MessagesController < ApplicationController

  def create
    ActionCable.server.broadcast 'messages', #messages is name of channel
      message: "put content here",
      user: "put username here"
    head :ok #error
 
  end
end