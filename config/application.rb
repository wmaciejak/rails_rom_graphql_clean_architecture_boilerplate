require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)
ENVied.require(*ENV['ENVIED_GROUPS'] || Rails.groups)

module ExampleProject
  class Application < Rails::Application
    require "container"

    config.enable_dependency_loading = true
    config.autoload_paths << Rails.root.join('app/graphql')
    config.autoload_paths << Rails.root.join('app/graphql/types')
    config.api_only = true

    config.middleware.delete Rack::Sendfile
    config.middleware.delete Rack::MethodOverride
    config.middleware.delete ActionDispatch::RequestId
    config.middleware.delete ActionDispatch::Cookies
    config.middleware.delete ActionDispatch::Session::CookieStore
    config.middleware.delete ActionDispatch::Flash
    config.middleware.delete Rack::Head
    config.middleware.delete Rack::ETag
    config.middleware.delete Rack::ConditionalGet
  end
end
