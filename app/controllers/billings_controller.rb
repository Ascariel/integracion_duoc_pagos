class BillingsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def generate_payment
    redirect_to '/?alert=payment_successful'
  end

  def index
    @billings = current_user.billings.order(created_at: :desc)
    @card = current_user.card
  end

  def charge_customer
    # Obtener stripe customer
    stripe_customer = retrieve_stripe_customer(current_user, params)

    # Asignar stripe customer a nuestro User en DB
    current_user.update(stripe_customer_id: stripe_customer['id'])

    # Generar cobro en Stripe
    stripe_charge = Stripe::Charge.create(
      :amount => params[:amount],
      :currency => "clp",
      :customer => current_user.stripe_customer_id,
      :description => "Primer Cobro Para un Cliente Test"
    )

    # Recuperar Tarjeta desde Stripe
    stripe_card = stripe_customer.sources.retrieve(stripe_charge['source']['id'])

    # Crear Tarjeta en nuestra DB si no existe aun
    if current_user.card.blank?
      card_params = {
        user_id: current_user.id,
        brand: stripe_card['brand'],
        last_4: stripe_card['last4'],
        expiry_month: stripe_card['exp_month'],
        expiry_year: stripe_card['exp_year'],
        stripe_card_id: stripe_card['id']
      }
      Card.create!(card_params)
    end


    status = stripe_charge['paid'] ? 'pagado' : 'pendiente'

    billing_params = {
      user_id: current_user.id,
      total_price: params[:amount],
      status: status,
      purchase_date: Time.current,
      order_code: "#{rand(100000000) + 99999999}",
      stripe_charge_id: stripe_charge['id']
    }
    billing = Billing.create!(billing_params)
    details = params[:billing_details].values

    billing_details = details.map do |detail_hash|
      product = Product.find(detail_hash[:product_id].to_i)
      quantity = detail_hash[:amount].to_i

      puts "quantity is #{quantity}  #{product.price_clp}"

      billing_detail = BillingDetail.create({
        product_id: product.id,
        billing_id: billing.id,
        unit_price: product.price_clp,
        quantity: quantity,
        total_price: quantity * product.price_clp
      })
    end

    # formatted_details = format_billing_details(billing)
    # email_params = {
    #   name: current_user.name,
    #   email: current_user.email,
    #   purchase_date: billing.purchase_date,
    #   total_price: billing.total_price,
    #   order_code: billing.order_code,
    #   billing_details: formatted_details
    # }

    # puts "\n\n ======= EMAIL PARAMS ARE: \n\n #{email_params}"

    # Send POST REQUEST here
    SendEmailJob.perform_later(billing.id)
    # url = 'https://b7f8fab3.ngrok.io/servicios/Mensajero.svc/EnviarCorreo'
    # response = RestClient.post(url, email_params.to_json, { content_type: :json, accept: :json })
    # puts "\n\n\ =======  RESPONSE: \n\n #{r.inspect}"
    # Send POST REQUEST here
    render json: { success: true }
    # render json: { details: email_params, response: response }
    # redirect_to '/billings?alert=payment_successful'
  end

  private

  def format_billing_details(billing)
    billing.billing_details.map do |billing_detail|
      product = billing_detail.product
      {
        name: product.name,
        unit_price: product.price_clp,
        quantity: billing_detail.quantity,
        product_total_price: billing_detail.total_price
      }
    end
  end

  def retrieve_stripe_customer(current_user, params)
    return Stripe::Customer.retrieve(current_user.stripe_customer_id) if current_user.stripe_customer_id

    Stripe::Customer.create(
      email: current_user.email,
      description: "UserID: #{current_user.id}",
      metadata: { user_id: current_user.id },
      source: params[:stripe_token][:id]
    )
  end

  def verify_authenticity_token
    true
  end
end
