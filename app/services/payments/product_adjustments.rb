module Payments
  class ProductAdjustments

    include Payments::Helpers::AdjustStock

    attr_reader :order
    
    def initialize(order)
      @order = order
    end

    def call
      adjust_stock
    end
    
  end
end