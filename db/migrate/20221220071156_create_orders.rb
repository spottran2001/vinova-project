class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :status, default: "pending "
      t.decimal :total_price
      t.belongs_to :user

      t.timestamps
    end
  end
end
