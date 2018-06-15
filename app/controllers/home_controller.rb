class HomeController < ApplicationController
  require 'rest-client'
  # layout false
  # layout 'application', :except => :test

  def divisas
    # Hacemos la llamada a la API de divisas
    response = RestClient.get('http://mindicador.cl/api/dolar')

    # Parseamos la respuesta
    formatted_response = JSON.parse(response)['serie']

    # Tomamos solo los ultimos 7 dias
    @ultima_semana = formatted_response.first(7)

    return render json: params if params[:test]

    # En la vista divisas.html mostramos los datos rescatados
  end

  def index
    @categories = Category.all
  end

  def test
    # render json: {success: true}
  end

  def test_captcha
    data = {
      secret: Rails.application.secrets.captcha_secret_key,
      response: params['g-recaptcha-response']
    }

    # Rails.application.secrets.captcha_secret_key
    r = RestClient.post('https://www.google.com/recaptcha/api/siteverify', data)
    r2 = JSON.parse(r)
    render json: {r2: r2, success: r2['success']}
    # render json: {r2: r2, data: data, parameters: params, env: Rails.env}
  end

end
