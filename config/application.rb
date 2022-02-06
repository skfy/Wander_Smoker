require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WanderSmoker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
Refile.secret_key = 'ddf76bfd55fddc3638d4e76d9a3cbbcc0e5dc61322277aaccfeb88af7ab927ab7819f0b5aaff0309530b7b5897f90ab2004a6e4eaff65f4837f9d43b65602ea9'