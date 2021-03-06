Rails.application.configure do
  config.action_controller.allow_forgery_protection = false
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = true
  config.action_mailer.delivery_method = :test
  config.active_support.deprecation = :stderr
  config.active_support.test_order = :random
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.eager_load = false
  config.serve_static_files = true
  config.static_cache_control = 'public, max-age=3600'
end
