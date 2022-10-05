class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method
      t.integer :status, default: 0, null: false
    end
  end
end
