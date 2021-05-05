class Api::AddressesController < ApiController
  # WHY: allow Address to be set up independently from Order.
  # This is usual for e-commerce apps.
  
  def index
    render json: @user.addresses
  end

  def show
    render json: @user.addresses.find(params[:id])   
  end

  def create
    address = @user.addresses.build(permitted_params)

    if address.save
      render json: @user, with: [:address]
    else
      render json: { errors: address.errors }, status: :unprocessable_entity
    end
  end

  def update
    address = Address.find(params[:id])

    if address.save
      render json: @user, with: [:address]
    else
      render json: { errors: address.errors }, status: :unprocessable_entity
    end
  end

  def delete
    address = Address.find(params[:id])

    if address.destroy
      render json: address
    else
      render json: { errors: address.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def permitted_params
    params.require(:address).permit(
      :line1, :line2, :city, :state, :postal_code, :country
    )
  end
end