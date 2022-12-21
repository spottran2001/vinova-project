class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.decimal :product_price
      t.belongs_to :order
      t.belongs_to :product
      t.integer :product_quantity, default: 0

      t.timestamps
    end
  end
end
