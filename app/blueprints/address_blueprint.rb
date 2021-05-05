class AddressBlueprint < Blueprinter::Base
  identifier :id

  fields :line1, :line2, :city, :state, :postal_code
end