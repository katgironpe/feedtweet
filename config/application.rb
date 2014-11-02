require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Newstweet
  class Application < Rails::Application
    config.autoload_paths << config.root.join('lib')
  end
end

Rails.application.config.generators do |g|
  g.assets false
  g.helper false
  g.test_framework :rspec, controller_specs: true,
    view_specs: false,
    request_specs: false,
    routing_specs: false
end

Rails.application.configure do
  config.active_job.queue_adapter = :sidekiq
end
