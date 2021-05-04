class Api::OrdersController < ApiController
  before_action :set_user

  def index
    orders = @user.orders
    render json: OrderBlueprint.render(orders)
  end

  def create
    order_creation = Orders::Order.new(permitted_params)

    if order_creation.call
      render json: OrderBlueprint.render(order_creation.order)
    else
      render json: { errors: order_creation.errors }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def permitted_params
    params.permit(
      customer: [:id],
      address: [:id],
      product_orders: [:product_id, :quantity]
    )
  end

end