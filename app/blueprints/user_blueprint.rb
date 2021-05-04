class AddressBlueprint < Blueprinter::Base
  identifier :id

  fields :email, :first_name, :last_name

  association :address, blueprint: AddressBlueprint
  association :order, blueprint: OrderBlueprint
end