class PaymentMailer < ApplicationMailer
  layout "mailer"

  def payment_update
    @user = params[:user]
    mail(to: @user.email, subject: 'Your payment status')
  end
end