# frozen_string_literal: true

module V1
  class MessagesController < ApiController
    before_action :set_room

    def index
      render json: @room.messages.all
    end

    def create
      room = Room.find(params[:room_id])
      message = room.messages.new(message_params)
      message.user_id = User.first.id
      if message.save!
        ActionCable.server.broadcast "room_#{room.id}", message: message
      end
      render json: @room, status: :created
    end

    def search
      unless params[:query].blank?
        results = Message.search(params[:query]).results.map { |r| r._source.content }
      end
      render json: results
    end

    private

    def message_params
      params.permit(:content)
    end

    def set_room
      @room = Room.find(params[:room_id])
    end
  end
end
