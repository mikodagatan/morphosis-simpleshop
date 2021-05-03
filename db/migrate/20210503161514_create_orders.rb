class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :reference_code
      t.decimal :total, precision: 14, scale: 2
      t.integer :customer_id, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end

    add_index :orders, :customer_id, unique: true
  end
end
