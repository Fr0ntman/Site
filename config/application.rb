require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module Kursomir
  class Application < Rails::Application
    config.active_record.default_timezone = :local
    config.active_record.raise_in_transactional_callbacks = true
    config.i18n.default_locale = :ru
    config.tinymce.install = :compile
    config.generators do |g|
		  g.test_framework  :rspec, :fixture => false
	    g.view_specs      false
	    g.helper_specs    false
		end
  end
end
