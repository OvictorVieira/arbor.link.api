class ApplicationController < ActionController::API
  before_action :authenticate_request

  def decode_token(token)
    body = JWT.decode(token, Rails.application.config.app.jwt.jwt_secret)[0]
    HashWithIndifferentAccess.new body
  rescue
    nil
  end

  private

  def authenticate_request
    @current_user = decode_token(request.headers['Authorization'])
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
