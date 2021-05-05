class Test::PaymentWorker
  include Sidekiq::Worker

  def perform(params)
    TestPayments::Payments.new(params['order_id']).call    
  end
end
  