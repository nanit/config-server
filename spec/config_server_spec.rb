require 'spec_helper'
ENV['RACK_ENV'] = 'test'
require 'rack/test'
require 'yaml'
require 'json'

describe ConfigServer do
  include Rack::Test::Methods
  CONFIG_FILE = "spec/test_config.yml"

  it 'has a version number' do
    expect(ConfigServer::VERSION).not_to be nil
  end

  describe "web server" do

    def app
      ConfigServer::App.new(CONFIG_FILE, nil)
    end

    before {get request_path}

    context "key exists" do

      let(:request_path) { "/production/api/db_url" }

      it "should return 200 ok" do
        expect(last_response).to be_ok
      end

      it "should return the right value" do
        expect(last_response.body).to eq(YAML.load_file(CONFIG_FILE)['production']['api']['db_url'])
      end

    end

    context "key in the middle of chain" do

      let(:request_path) { "/production/api" }

      it "should return 200 ok" do
        expect(last_response).to be_ok
      end

      it "should return a json repesentation of the key" do
        expect(last_response.body).to eq(YAML.load_file(CONFIG_FILE)['production']['api'].to_json)
      end
    end

    context "bad key" do

      let(:request_path) {"/production/false/key"}
      
      it "should return 404 not found" do
        expect(last_response).to be_not_found
      end

      it "should return an empty body" do
        expect(last_response.body).to be_empty
      end
    end

  end

end

