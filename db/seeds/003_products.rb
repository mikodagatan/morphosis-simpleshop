Region.all.each do |region|
  35.times.each do 
    Product.create(
      region: region,
      title: Faker::Game.title,
      description: "#{Faker::Game.genre} from #{Faker::Game.platform}",
      image: "https://picsum.photos/200",
      price: Faker::Number.decimal(r_digits: 2),
      sku: Faker::Code.imei,
      stock: 10,
    )
  end
end