module Orders
  module Helpers
    module SetOrder
      private

      def set_order
        @order.total = @order.product_orders.pluck(:subtotal).sum
        @order.save
      end
      
    end
  end
end