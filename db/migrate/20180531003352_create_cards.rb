class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.integer :status
      t.string :brand
      t.string :fingerprint
      t.string :expiry_month
      t.string :expiry_year
      t.string :stripe_card_id

      t.timestamps
    end
  end
end
