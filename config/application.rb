require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Alrik
  class Application < Rails::Application
    config.i18n.available_locales = [:en, :de, :fr, :nl]
    config.i18n.default_locale = :en

    # PATCH-Regquests from Coldfusion9 require MethodOverride
    config.middleware.use ::Rack::MethodOverride

    config.time_zone = "Europe/Berlin"
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins "*"
        resource "*", headers: :any, methods: %i(get post patch delete options)
      end
    end

    # This is important in order to get the right remote IP!
    # Wrong settings might result in a wrong IP being detected as the remote IP.
    # Even IP spoofing is possible!!!
    ActionDispatch::RemoteIp::TRUSTED_PROXIES.clear
    ActionDispatch::RemoteIp::TRUSTED_PROXIES << "192.168.6.142"
    ActionDispatch::RemoteIp::TRUSTED_PROXIES << "192.168.6.143"
  end
end
