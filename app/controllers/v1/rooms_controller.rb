# frozen_string_literal: true

module V1
  class RoomsController < ApiController
    before_action :set_room, only: %i[show update destroy]

    def index
      @rooms = Room.all
      render json: @rooms
    end

    def create
      @room = Room.create!(room_params)
      render json: @room
    end

    def show
      render json: @room
    end

    def update
      @room.update(room_params)
      head :no_content
    end

    def destroy
      @room.destroy
      head :no_content
    end

    private

    def room_params
      params.permit(:title)
    end

    def set_room
      @room = Room.find(params[:id])
    end
  end
end
