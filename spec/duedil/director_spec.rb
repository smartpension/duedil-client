require 'spec_helper'
require 'duedil'

describe Duedil::Director do
  before do
    @api_key  = 'exampleapikey'
    @base_url = 'duedil'
    @version  = 'v'
    @http     = double('http')
    @client = Duedil::Director.new version: @version,
                                   base_url: @base_url,
                                   api_key: 'test',
                                   http: @http
  end

  describe '#all' do
    it 'build the correct url for searching companies' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/directors?filters=%7B%22name%22%3A%22foo%22%7D&api_key=test")
      @client.all(name: 'foo')
    end
  end

  describe '#get' do
    it 'build the correct url for fetching a company' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/directors/1?api_key=test")
      @client.get(1)
    end
  end

  describe '#companies' do
    it 'build the correct url for fetching registered_address' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/directors/1/companies?api_key=test")
      @client.companies(1)
    end
  end

  describe '#directorships' do
    it 'build the correct url for fetching previous_company_names' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/directors/1/directorships?api_key=test")
      @client.directorships(1)
    end
  end

  describe '#service_addresses' do
    it 'build the correct url for fetching industries' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/directors/1/service-addresses?api_key=test")
      @client.service_addresses(1)
    end
  end

end
