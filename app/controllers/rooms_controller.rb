class RoomsController < ApplicationController
  
    def show
      @messages = Room.first.all
    end
  end
  