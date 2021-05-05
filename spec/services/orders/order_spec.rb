require "rails_helper"

RSpec.describe Orders::Order do
  describe "#order" do

    def base_init
      @products = (1..3).map { create(:product) }
      @address = create(:address)
      @customer = @address.user
    end

    context "when quantities are valid" do
      before :all do
        base_init
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

      it "should create an Order" do
        expect(Order.find(@instance.order.id)).to be_truthy
      end

      it "should cost a total of 6000" do
        expect(@instance.order.total).to eq(6000.to_d)
      end

      it "should decrease the stock number of the products" do
        puts "" # linebreaker

        @product_orders.each do |product_order|

          product = Product.find(product_order[:product_id])
          puts "#{product.title} stock decreased to #{product.stock}"

          expect(product.stock).to eq(10 - product_order[:quantity])
        end
      end
    end

    context "when quantities to buy are more than the stocks" do
      before :all do
        base_init
        @product_orders = @products.map do |product|
          { product_id: product.id, quantity: 11 }
        end
        @order_params = {
          address: @address,
          customer: @customer,
          product_orders: @product_orders
        }
        @instance = Orders::Order.new(@order_params)
        @response = @instance.call
      end

      it "responds with an error" do
        expect(@response).to eq(
          ["cannot order more than the product stock"]
        )
      end

      it "should have the same stock amount" do
        puts "" # linebreaker

        @product_orders.each do |product_order|
          product = Product.find(product_order[:product_id])

          puts "#{product.title} stock decreased to #{product.stock}"

          expect(product.stock).to eq(10)
        end
      end
    end
  end
end
