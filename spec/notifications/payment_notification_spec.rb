require "rails_helper"

RSpec.describe PaymentNotification do
  describe "#deliver" do
    context "when now" do
      before :all do
        @products = (1..3).map { create(:product) }
        @address = create(:address)
        @customer = @address.user
        @product_orders = @products.map do |product|
          { product_id: product.id, quantity: 2 }
        end
        @order_params = {
          address: @address,
          customer: @customer,
          product_orders: @product_orders 
        }
        @instance = Orders::Order.new(@order_params)
        @instance.call
      end

      it "creates a DB record" do
        PaymentNotification.with(order: @instance.order).deliver(@customer)
 
        expect(Notification.all.size).to eq(1)
      end

    end
  end
end