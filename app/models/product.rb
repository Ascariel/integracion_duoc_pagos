class Product < ApplicationRecord
  belongs_to :category

  def price_clp
    price_dollars * 629
  end
end
