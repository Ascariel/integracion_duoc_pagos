class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
         # :recoverable, :rememberable, :trackable, :validatable


  has_many :billings, dependent: :destroy
  has_one :card, dependent: :destroy

end
