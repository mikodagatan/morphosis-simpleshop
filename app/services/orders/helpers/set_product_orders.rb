module Orders
  module Helpers
    module SetProductOrders
      private

      # NOTE: order_params, Hash
      def set_product_orders
        @product_orders.each do |product_order_params|
          product = Product.find(product_order_params[:product_id])
          qty = product_order_params[:quantity]

          product_order = @order.product_orders.build(
            product: product,
            quantity: qty,
            subtotal: product.price * qty
          )
          product_order.save
        end
        @order
      end

    end
  end
end