class MessagesController < ApplicationController  

  def index
    @results = Message.search( params[:query] ).results.first._source.content unless params[:query].blank?
    render  @results
  end

  def create
    @message = Message.create!(content: params[:message][:content], user_id: current_user.id)
    ActionCable.server.broadcast('room_channel', content:  @message.content, username: @message.user_id)
  end
end
