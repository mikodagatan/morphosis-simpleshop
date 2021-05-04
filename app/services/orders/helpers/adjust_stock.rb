module Orders
  module Helpers
    module AdjustStock
      private
      
      def adjust_stock

        ActiveRecord::Base.transaction do
          @order.product_orders.each do |product_order|
            product = product_order.product

            if product.stock < product_order.quantity
              @errors << 'cannot order more than the product stock'
              raise ActiveRecord::Rollback
            end

            product.stock = product.stock - product_order.quantity
            product.save
          end
        end

      end

    end
  end
end