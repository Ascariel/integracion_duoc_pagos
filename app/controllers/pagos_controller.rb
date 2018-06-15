class PagosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create_card
    email = params[:email] || 'pablocangas@gmail.com'

    Stripe::Customer.create(
      email: email,
      description: 'Mi Primer Cliente',
      source: "tok_mastercard"
    )

    return render json: {success: true}
  end

  def charge_customer
    return render json: {params}
  end

  def send_email_info
    route = params[:local]

    base_url = 'http://408c90ca.ngrok.io/cliente/Default.aspx'
    url_params = 'name=UsuarioTest2&email=test@test.com,amount=100&test=true'
    final_url = "#{base_url}?#{url_params}"

    return redirect_to final_url
    # RestClient.get(final_url)
  end

  # def test_get_request
  #   url_params = '?name=UsuarioTest&email=test@test.com,amount=100&test=true'
  #   base_url = 'http://408c90ca.ngrok.io/cliente/Default.aspx'
  #   final_url = "#{base_url}?#{url_params}"
  #   return redirect_to "#{final_url}"
  #   # return redirect_to "/receive_get_params#{url_params}"
  # end

  # def receive_get_params
  #   return render json: params
  # end

  def test_post_request
    # EMAIL PARAMS
    email_params = {
      name: 'Pablo Cangas',
      email: 'pablocangas@gmail.com',
      purchase_date: '13-06-2018',
      total_price: 15000,
      order_code: '#8798234986879',
      billing_details: [
        # Arreglo con la estructura de los detalles individuales
        {
          name: 'Hamburguesa X',
          unit_price: 3000,
          quantity: 3,
          product_total_price: 9000
        },
        {
          name: 'Fanta',
          unit_price: 1000,
          quantity: 3,
          product_total_price: 3000
        },
        {
          name: 'Papas Chicas',
          unit_price: 1500,
          quantity: 2,
          product_total_price: 3000
        }
      ]
    }
    url = 'https://b7f8fab3.ngrok.io/servicios/Mensajero.svc/EnviarCorreo'
    r = RestClient.post(url, email_params)

     r = RestClient.post(url, email_params, {content_type: :json, accept: :json})
    # r = RestClient.post 'https://6b627ca8.ngrok.io/servicios/Mensajero.svc/EnviarCorreo', email_params.to_json
    return render json: { r: r}
  end

  def receive_post_params
    return render json: params
  end
end
