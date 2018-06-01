class PagosController < ApplicationController
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
    # params = { name: 'Usuario Test', email: 'test@test.com', amount: '100', items: ['Hamburguesa', 'Bebida XL']}
    params = { name: 'Usuario Test', email: 'test@test.com', amount: '100'}
    r = RestClient.post 'https://97ee3e32.ngrok.io/Cliente/default.aspx/', params
  end

  def receive_post_params
    return render json: params
  end
end
