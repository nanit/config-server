# ConfigServer

The simplest way to store YAML configuration and server it over HTTP

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'config_server'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install config_server

## Usage
To run the server you must have a configuration file first:
```yaml
#config.yml

production:
  api:
    db_host: prod.mydb.com
    s3_bucket: some-bucket-prod
  nginx:
    server_name: www.me.prod

staging:
  api:
    db_host: staging.mydb.com
    s3_bucket: some-bucket-staging
  nginx:
    server_name: www.me.staging
```
Then create the following ruby file:
```ruby
#my_configuration_server.rb

require 'config_server'

ConfigServer.start("config.yml")
```

and run `bundle exec ruby my_configuration_server.rb`

You can now query the server:



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/config_server. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

