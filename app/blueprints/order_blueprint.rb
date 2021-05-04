class OrderBlueprint < Blueprinter::Base
  identifier :id

  fields :reference_code, :total

  association :product_order, blueprint: ProductOrderBlueprint
  association :customer, blueprint: UserBlueprint
  association :address, blueprint: AddressBlueprint
end