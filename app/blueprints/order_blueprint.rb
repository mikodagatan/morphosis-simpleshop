class OrderBlueprint < Blueprinter::Base
  identifier :id

  fields :reference_code, :total

  association :product_orders, blueprint: ProductOrderBlueprint
  association :customer, blueprint: UserBlueprint
  association :address, blueprint: AddressBlueprint
end