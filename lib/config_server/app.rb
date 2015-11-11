require 'yaml'
require 'logger'

class ConfigServer::App

  def initialize(config_file, logger_output = STDOUT)
    @logger = Logger.new(logger_output)
    @logger.info "Starting config server with config:"
    @config = YAML.load_file(config_file)
    @logger.info @config
  end

  def call(env)
    request_path = env['PATH_INFO']
    @logger.info "Got request for #{request_path}"
    value = get_key_from_yaml(request_path)
    if value
      ['200', {'Content-Type' => 'text/plain'}, [value]]
    else
      ['404', {'Content-Type' => 'text/plain'}, []]
    end
  end

  private

  def get_key_from_yaml(path)
    keys = path.split("/").reject(&:empty?)
    val = keys.inject(@config, &:fetch)
    val
  rescue
    nil
  end

end
