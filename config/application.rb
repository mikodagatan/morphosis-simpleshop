require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SimpleShop
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.api_only = true
    config.debug_exception_response_format = :default

    console do
      require "pry"
      config.console = Pry
    end

    # use sidekiq for queueing
    config.active_job.queue_adapter = :sidekiq

    # configure mailer layout
    config.to_prepare do
      Devise::Mailer.layout "mailer" 
    end
  end
end
