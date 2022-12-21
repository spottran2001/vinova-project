class CreateCheckouts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkouts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text :address, null: false
      t.text :secound_address
      t.bigint :postal_code, null: false
      t.string :country, null: false
      t.bigint :phone_number, null: false 
      t.belongs_to :user

      t.timestamps
    end
  end
end
