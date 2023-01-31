require "config_server/version"
require "config_server/app"
require "rack"

module ConfigServer
  def self.start
    port = ENV["SERVER_PORT"] || 8080
    config_file = ENV["CONFIG_FILE"] || "config.yml"
    Rack::Server.start(:Host => "0.0.0.0", :Port => port, :app => ConfigServer::App.new(config_file))
  end
end
