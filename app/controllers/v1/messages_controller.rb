# frozen_string_literal: true

module V1
  class MessagesController < ApiController
    def index
      render json: Message.all
    end

    def create 
      @message = Message.create!(content: params[:message][:content], user_id: current_user.id)
      ActionCable.server.broadcast('room_channel', content:  @message.content, username: @message.user_id)
    end

    def search
      unless params[:query].blank?
        results = Message.search(params[:query]).results.map { |r| r._source.content }
      end
      render json: results
    end
  end
end
