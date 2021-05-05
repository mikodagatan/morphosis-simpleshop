module Payments
  module Helpers
    module AdjustStock

      def adjust_stock
        
        if order.cancelled? || order.failed?
          order.product_orders.each do |product_order|
            product = product_order.product
            product.stock = product_order.quantity + product.stock
            product.save
          end
        end

      end

    end
  end
end