class MessagesController < ApplicationController  
  def create
    @message = Message.create!(content: params[:message][:content], user_id: current_user.id)
    ActionCable.server.broadcast('room_channel', content:  @message.content, username: @message.user_id)
  end
end
