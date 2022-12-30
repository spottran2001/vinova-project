class AddColumnsToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :product_name, :string
    add_column :order_details, :photo, :string
  end
end
