class PagosController < ApplicationController

  def create_card
    email = params[:email] || 'pablocangas@gmail.com'
    email = params[:email] || 'andrea@gmail.com'

    Stripe::Customer.create(
      email: email,
      description: 'Mi Primer Cliente',
      source: "tok_mastercard"
    )

    return render json: {success: true}
  end
end
