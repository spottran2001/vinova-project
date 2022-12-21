class CreateCartDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_details do |t|
      t.decimal :product_price
      t.belongs_to :cart
      t.belongs_to :product
      t.integer :product_quantity, default: 0

      t.timestamps
    end
  end
end
