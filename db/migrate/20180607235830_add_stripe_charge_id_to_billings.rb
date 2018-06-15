class AddStripeChargeIdToBillings < ActiveRecord::Migration[5.2]
  def change
    add_column :billings, :stripe_charge_id, :string
  end
end
