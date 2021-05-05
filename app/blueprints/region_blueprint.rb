class RegionBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :code, :currency, :tax_percentage
end