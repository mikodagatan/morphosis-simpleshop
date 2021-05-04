module Orders
  module Helpers
    module SetProductOrders
      private

      def set_product_orders
        @order_params.product_orders.each do |product_order|
          product = Product.find(product_order.id)
          @order.product_orders.build(
            product: product,
            quantity: product_order.quantity
            subtotal: product * product_order.quantity
          )
        end
        @order
      end

    end
  end
end