# To deliver this notification:
#
# PaymentNotification.with(post: @post).deliver_later(current_user)
# PaymentNotification.with(post: @post).deliver(current_user)

class PaymentNotification < Noticed::Base
  deliver_by :database
  deliver_by :action_cable, wait: 1.minute
  deliver_by :email, 
    mailer: "PaymentMailer", 
    method: :payment_update,
    format: :mail_params

  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  param :order

  def order
    params[:order]
  end

  def user
    order.customer
  end

  def message
    t(
      ".message.#{order.status}", 
      reference_code: order.reference_code,
      total_price: order.total_price,
    )
  end

  def url
    api_user_order_path(order.customer, order)
  end

  def mail_params
    {
      order: order,
      user: user,
      message: message,
      url: url
    }
  end

  def payment_gateway_url
    "http://sample-url.com"
  end

end
