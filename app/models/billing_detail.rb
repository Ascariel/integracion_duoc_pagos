class BillingDetail < ApplicationRecord
  belongs_to :product
  belongs_to :billing
end
