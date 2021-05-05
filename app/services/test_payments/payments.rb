module TestPayments
  class Payments
    attr_reader :order
    def initialize(order)
      @order = order
    end

    def call
      order.status = ["paid", "failed"].sample
      order.save

      self
    end
  end
end