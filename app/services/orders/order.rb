module Orders
  class Order
    include Orders::Helpers::AdjustStock
    include Orders::Helpers::SetOrder
    include Orders::Helpers::SetProductOrders
    include Orders::Helpers::SetReferenceCode

    attr_reader :order, 
                :order_params, 
                :customer, 
                :address, 
                :region,
                :errors


    def initialize(params)
      params = params.to_h.deep_symbolize_keys!
      @customer = params[:customer]
      @address = params[:address]
      @product_orders = params[:product_orders]
      @errors = []

      @order = ::Order.new(
        customer: customer,
        address: address,
        status: :pending
      )
    end

    def call
      ActiveRecord::Base.transaction do
        begin
          set_reference_code
          set_product_orders
          adjust_stock
          set_order

          self
        rescue => e
          ActiveRecord::Rollback
        end
        
        errors.length > 0 ? errors : self
      end
      
    end

  end
end