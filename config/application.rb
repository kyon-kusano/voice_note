require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VoiceNote
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja
    #以下の記述を追記する(設定必須)
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
    # config.load_defaults 5.2

    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
  end
end

# config.i18n.default_locale = :ja
# config.assets.initialize_on_precompile = false