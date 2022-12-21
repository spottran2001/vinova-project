class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :payment_type
      t.string :name_on_card
      t.string :card_number
      t.string :expiry_date
      t.integer :security_code
      t.belongs_to :order
      t.belongs_to :checkout

      t.timestamps
    end
  end
end
