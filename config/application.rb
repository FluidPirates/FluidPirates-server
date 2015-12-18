require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module FluidPirates
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.action_mailer.default_url_options = { host: 'fluidpirates.com' }
  end
end
