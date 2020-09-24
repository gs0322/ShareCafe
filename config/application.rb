require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ShareCafe
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.test_framework  :rspec,
                        fixtures: true,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false,
                        controller_specs: false,
                        request_specs: true,
                        system_specs: true
    end
    # 日本語化
    config.i18n.default_locale = :ja
    # 日本のタイムゾーン
    config.time_zone = 'Asia/Tokyo'
    #Railsが自動挿入されないようにする
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end



end
