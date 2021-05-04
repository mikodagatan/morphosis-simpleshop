class Api::OrdersController < ApiController
  before_action :set_user

  def index
    orders = @user.orders
    render json: OrderBlueprint.render(orders)
  end

  def create
    # create a service object for this.
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def permitted_params
    params.require(:order).permit()
  end

end