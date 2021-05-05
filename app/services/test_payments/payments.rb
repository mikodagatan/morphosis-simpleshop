module TestPayments
  class Payments
    attr_reader :order

    def initialize(order_id)
      @order = Order.find(order_id)
    end

    def call
      order.status = ["paid", "failed", "cancelled"].sample
      order.save

      self
    end
  end
end