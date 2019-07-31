class ApiController < ActionController::API
  acts_as_token_authentication_handler_for User, unless: :no_authentication

  def no_authentication
    _process_action_callbacks.map {|c| c.filter }.compact.include? :no_authentication
  end
end
