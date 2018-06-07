class BillingsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def generate_payment
    redirect_to '/?alert=payment_successful'
  end

  def charge_customer
    if current_user.stripe_customer_id
      stripe_customer = Stripe::Customer.find(current_user.stripe_customer_id)
    else
      stripe_customer = Stripe::Customer.create(
        email: current_user.email,
        description: "UserID: #{current_user.id}",
        source: params[:stripe_token][:id]
      )
    end

    puts stripe_customer

    billing_params = {
      user_id: current_user.id,
      total_price: params[:amount],
      status: 'pagado',
      purchase_date: Time.current,
      order_code: "#{rand(100000000) + 99999999}"
    }
    Billing.create!(billing_params)

    redirect_to '/billings?alert=payment_successful'
  end

  def verify_authenticity_token
    true
  end

  def index
    @billings = current_user.billings.order(created_at: :desc)
  end
end
