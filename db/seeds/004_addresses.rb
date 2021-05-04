regions = Region.all
User.all.each do |user|
  3.times do
    address = user.addresses.build(
      line1: Faker::Address.street_address,
      line2: Faker::Address.community,
      city: Faker::Address.city,
      state: Faker::Address.state,
      postal_code: Faker::Address.postcode,
      region: regions.sample,
    )
    address.save
  end
end