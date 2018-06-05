class BillingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def generate_payment
    return redirect_to '/?alert=payment_successful'
    # render json: { success: true }
  end
end
