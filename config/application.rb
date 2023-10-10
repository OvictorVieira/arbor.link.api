require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ArborLinkApi
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w(assets tasks))

    config.app = OpenStruct.new
    config.app.jwt = OpenStruct.new
    config.app.database = OpenStruct.new

    config.app.database.host = Rails.application.credentials[:database][Rails.env.to_sym][:host]
    config.app.database.user = Rails.application.credentials[:database][Rails.env.to_sym][:username]
    config.app.database.password = Rails.application.credentials[:database][Rails.env.to_sym][:password]
    config.app.database.name = Rails.application.credentials[:database][Rails.env.to_sym][:name]

    config.app.jwt.jwt_secret = Rails.application.credentials[:jwt][Rails.env.to_sym][:jwt_secret]

    config.api_only = true
  end
end
