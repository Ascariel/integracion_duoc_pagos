class Billing < ApplicationRecord
  has_many :billing_details, dependent: :destroy
  belongs_to :user

  enum status: { pendiente: 0, pagado: 1 }
end
