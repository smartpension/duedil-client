require 'spec_helper'
require 'duedil/client'

describe Duedil::Client do
  before do
    @api_key  = 'exampleapikey'
    @base_url = 'duedil'
    @version  = 'v'
    @http     = double('http')
    @client = Duedil::Client.new version: @version,
                                 base_url: @base_url,
                                 api_key: 'test',
                                 http: @http
  end

  describe '#company' do
    it 'build the correct url for fetching a company' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1?api_key=test")
      @client.company(1)
    end
  end

  describe '#companies' do
    it 'build the correct url for searching companies' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies?filters=%7B%22name%22%3A%22foo%22%7D&api_key=test")
      @client.companies(name: 'foo')
    end
  end
end
