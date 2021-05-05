class Api::OrdersController < ApiController
  before_action :set_user

  def index
    orders = @user.orders
    render json: OrderBlueprint.render(orders)
  end

  def create
    order_creation = Orders::Order.new(permitted_params)
    Test::PaymentWorker.perform_at(1.minute.from_now) # updates status randomly

    if order_creation.call
      render json: OrderBlueprint.render(order_creation.order)
    else
      render json: { errors: order_creation.errors }
    end
  end

  def update
    order = Order.find(params[:id])
    authorize order, :update?

    if order.update(update_params)
      render json: OrderBlueprint.render(order)
    else
      render json: { errors: order.errors }
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

  def update_params
    params.require(:order).permit(:status)
  end

end