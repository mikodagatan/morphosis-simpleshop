class Api::OrdersController < ApiController
  before_action :set_user

  def index
    render json: @user.orders, with: [:product_orders]
  end

  def create
    # create a service object for this.
  end

  private

  def before_action
    @user = User.find(params[:user_id])
  end

  def permitted_params
    params.require(:order).permit()
  end

end