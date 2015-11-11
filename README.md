# ConfigServer

The simplest way to store YAML configuration and serve it over HTTP

## Example config.yml

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

You have two options for running the server:

## Option 1: Running With Docker

ConfigServer has a docker image on Docker Hub. To use it create a config.yml
file and mount it into the container:

    $ docker run -d -p 8080:8080 -v /path/to/your/config.yml:/usr/src/app/config.yml nanit/config_server

## Option 2: Running Your Ruby Script

### 1. Install config_server Gem

Add this line to your application's Gemfile:

```ruby
gem 'config_server'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install config_server

### 2. Run Your Ruby Script

Then create the following ruby file:
```ruby
#my_configuration_server.rb

require 'config_server'

ConfigServer.start("config.yml")
```

Then run 
    $ bundle exec ruby my_configuration_server.rb

## Querying The Server

To get a value just chain the key path as your HTTP request path:
`GET /production/nginx/server_name` to get the corresponding keys.

Some examples:

1. In the first example we get the production db host for the api service
2. In the second example we ask for a non existing key and get a 404 response
3. In the third example we ask for a key which has a hash value. We get a JSON
   representation of it.

![Usage Examples]
(https://raw.githubusercontent.com/nanit/config-server/master/doc/usage.png)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/config_server. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

