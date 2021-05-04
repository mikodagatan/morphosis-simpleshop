module Orders
  module Helpers
    module SetProductOrders
      private

      def set_product_orders
        @order_params.product_orders.each do |product_order|
          @order.product_orders.build(
            product_id: product_order.id,
            quantity: product_order.quantity
          )
        end
        @order
      end

    end
  end
end