require "config_server/version"
require "config_server/app"
require "rack"
require "rack/server"

module ConfigServer
  def self.start(config_file)
    Rack::Server.start(app: ConfigServer::App.new(config_file))
  end
end
