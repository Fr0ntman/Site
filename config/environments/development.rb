Rails.application.configure do
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_record.migration_error = :page_load
  config.active_support.deprecation = :log
  config.after_initialize do
    Bullet.enable = true
    Bullet.console = true
  end
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true
  config.cache_classes = false
  config.consider_all_requests_local = false
  config.eager_load = false
  config.sass.preferred_syntax = :sass
end
