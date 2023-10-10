class Api::V1::Users::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    @user = V1::Users::UsersService.create!(user_params)

    render json: ::UserSerializer.serialize_user(@user), status: :created
  rescue CreateFailureError => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
