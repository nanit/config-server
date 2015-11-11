require 'config_server'

$stdout.sync = true
ConfigServer.start("config.yml")
