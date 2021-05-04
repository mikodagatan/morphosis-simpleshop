class ProductOrderBlueprint < Blueprinter::Base
  identifier :id

  fields :quantity, :subtotal

  association :product, blueprint: ProductBlueprint
  association :order, blueprint: OrderBlueprint
end