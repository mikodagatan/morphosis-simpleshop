class PaymentMailer < ApplicationMailer
  layout "mailer"

  def payment_update
    @user = params[:user]
    @order = params[:order]
    @message = params[:message]
    @url = params[:url]
    mail(to: @user.email, subject: 'Your payment status')
  end
end