class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :title, null: false
      t.string :code, null: false
      t.string :currency, null: false
      t.decimal :tax_percentage, precision: 5, scale: 3

      t.timestamps
    end
  end
end
