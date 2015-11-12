# ConfigServer

The simplest way to serve configuration over HTTP.
Currently support YAML files as configuration DB.

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

## Option 2: Running Directly On Your Machine

### 1. Install config_server Gem

    $ gem install config_server

### 2. Run The Server

    $ CONFIG_FILE=/path/to/config.yml config_server

Note: You might need to run `$ eval "$(rbenv init -)"` in order to reload the
config_server binary shim if you're using rbenv.

## Querying The Server

To get a value just chain the key path as your HTTP request path:

`GET /production/nginx/server_name` to get the corresponding keys in your
config.yml file.

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

