class Billing < ApplicationRecord
  has_many :billing_details, dependent: :destroy
  belongs_to :user
end
