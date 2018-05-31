class HomeController < ApplicationController
  require 'rest-client'

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
    # flash[:success] = 'yey'
  end

end
