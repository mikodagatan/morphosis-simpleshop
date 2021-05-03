class ProductBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :description, :image, :price, :sku, :stock

  association :region, blueprint: RegionBlueprint
end