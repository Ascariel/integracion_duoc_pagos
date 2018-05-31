class CreateBillingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :billing_details do |t|
      t.integer :product_id
      t.integer :billing_id
      t.integer :total_price
      t.integer :unit_price
      t.integer :quantity
      t.timestamps
    end
  end
end
