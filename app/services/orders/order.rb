module Orders
  class Order
    attr_reader :order, :customer, :address, :region

    include Orders::Helpers::SetProductOrders

    def initialize(order:, customer:)
      @customer = customer
      @order_params = order.to_hash.deep_symbolize_keys!
      @order = Order.new(customer: customer)
    end

    def call
      set_product_orders
    end

  end
end