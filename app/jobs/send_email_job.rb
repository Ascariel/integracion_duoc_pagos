class SendEmailJob < ActiveJob::Base

  def perform(billing_id)
    billing = Billing.find(billing_id)
    email_params = format_billing_details(billing)

    # Send POST REQUEST here
    url = 'https://b7f8fab3.ngrok.io/servicios/Mensajero.svc/EnviarCorreo'
    RestClient.post(url, email_params.to_json, { content_type: :json, accept: :json })
    # Send POST REQUEST here
  rescue StandardError => e
    puts "\n\n ======= ERROR WHILE SENDING EMAIL POST REQUEST, \n\n ERROR: #{e.message} \n\n EMAIL PARAMS ARE: \n\n #{email_params}"
  end

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
end
