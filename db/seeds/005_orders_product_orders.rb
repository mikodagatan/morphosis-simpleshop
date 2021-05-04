
User.all.each do |user|
  addresses = user.addresses.sample(2)
  addresses.each do |address|
    region = address.region
    region_products = Product.in_region(region) 
    product1 = region_products.sample
    product2 = region_products.where.not(id: product1.id).sample
    
    order = Order.new(
      reference_code: Faker::Code.asin,
      status: :paid,
      customer: user,
      address: address
    )
    order.save

    [product1, product2].each do |product|
      qty = rand(1..2)
      qty = qty > product.stock ? product.stock : qty # adjust if the quantity is higher than the stock

      product_order = order.product_orders.build(
        product: product,
        quantity: qty,
        subtotal: product.price * qty
      )
      product_order.save
      product.update(stock: product.stock - qty)
    end

    order.update(
      total: order.product_orders.pluck(:subtotal).sum
    )
  end
end
