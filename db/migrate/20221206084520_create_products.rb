class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.integer :discount_percentage, default: 0
      t.integer :quantity_sold, default: 0
      t.string :company
      t.string :categories, array: true, default:[]
      t.string :product_types, array: true, default:[]
      t.text :description
      t.text :return_policy
      t.text :citizen_policy
  
      t.index :categories
      t.index :product_types

      t.timestamps
    end
  end
end
