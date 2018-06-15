class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :billings, dependent: :destroy
  has_one :card, dependent: :destroy

end
