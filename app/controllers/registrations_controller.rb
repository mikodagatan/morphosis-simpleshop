class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @user = User.new(sign_up_params)
    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    # NOTE: User created through request will always be a non-admin
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end