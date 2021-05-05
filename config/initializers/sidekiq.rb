require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL_SIDEKIQ', 'redis://localhost:6379/1') }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL_SIDEKIQ', 'redis://localhost:6379/1') }
end

# Configure Sidekiq-specific session middleware for routes
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"



# Old configuration
# Sidekiq.configure_server do |config|
#   config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:7002/0') }
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:7002/0') }
# end
