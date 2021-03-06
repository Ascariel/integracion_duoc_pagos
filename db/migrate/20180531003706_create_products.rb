class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :price_dollars
      t.integer :category_id

      t.timestamps
    end
  end
end
