Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_3xvc7dFgWyWyl21y0HjCn97v'],
  :secret_key      => ENV['sk_test_QMIINb5zPGxsCkbicqnH5ilK']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]