class Api::V1::Users::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]

  def login
    user = User.find_by(email: user_params[:email])
    if user&.authenticate(user_params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.config.app.jwt.jwt_secret, 'HS256')
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :email)
  end
end
