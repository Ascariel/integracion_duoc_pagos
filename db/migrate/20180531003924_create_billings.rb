class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.integer :user_id
      t.integer :total_price
      t.integer :status
      t.datetime :purchase_date
      t.integer :order_code
      t.timestamps
    end
  end
end
