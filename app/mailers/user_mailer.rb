class UserMailer < ActionMailer::Base
  # default from: 'alertas_pago@example.com'
  default from: 'from@example.com'
  layout 'mailer'

  def notify_payment(email:, payment_details: {})
    @nombre_usuario = payment_details[:nombre_usuario] || "Usuario Test"
    @monto_pagado = payment_details[:monto] || "20.000"

    mail(
         to: email,
         subject: "Pago Exitoso - Duoc Integracion"
    )
  end
end
