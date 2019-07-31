# frozen_string_literal: true

module V1
  class UsersController < ApiController
    before_action :no_authentication, only: :create

    def create
      user = User.create!(user_params)
      render json: user.as_json(only: [:authentication_token]), status: :created
    end

    private

    def user_params
      params.permit(
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
