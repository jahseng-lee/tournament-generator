require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TournamentGenerator
  class Application < Rails::Application
    config.load_defaults 6.0
    config.autoload_paths << Rails.root.join('app/lib/**')
  end
end
