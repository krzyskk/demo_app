class MessagesController < ApplicationController  
  def create
    @message = Room.first.messages.create!(content: params[:message][:content], user_id: User.first.id)
    ActionCable.server.broadcast('room_1', content:  @message.content)
  end
end
