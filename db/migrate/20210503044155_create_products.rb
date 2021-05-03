class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.string :image
      t.decimal :price, precision: 15, scale: 2
      t.string :sku
      t.integer :stock, null: false, default: 0
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
