# frozen_string_literal: true

module V1
  class SessionsController < ApiController
    before_action :no_authentication

    def authenticate
      user = User.where(email: params[:email]).first
      if user.valid_password?(params[:password])
        render json: user.as_json(only: [:authentication_token])
      else
        head(:unauthorized)
      end
    end
  end
end
