require 'spec_helper'
require 'duedil'

describe Duedil::Company do
  before do
    @api_key  = 'exampleapikey'
    @base_url = 'duedil'
    @version  = 'v'
    @http     = double('http')
    @client = Duedil::Company.new version: @version,
                                  base_url: @base_url,
                                  api_key: 'test',
                                  sandbox: 'true',
                                  http: @http
  end

  describe '#all' do
    it 'build the correct url for searching companies' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies?filters=%7B%22name%22%3A%22foo%22%7D&api_key=test")
      @client.all(name: 'foo')
    end
  end

  describe '#get' do
    it 'build the correct url for fetching a company' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1?api_key=test")
      @client.get(1)
    end
  end

  describe '#registered_address' do
    it 'build the correct url for fetching registered_address' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/registered-address?api_key=test")
      @client.registered_address(1)
    end
  end

  describe '#previous_company_names' do
    it 'build the correct url for fetching previous_company_names' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/previous-company-names?api_key=test")
      @client.previous_company_names(1)
    end
  end

  describe '#industries' do
    it 'build the correct url for fetching industries' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/industries?api_key=test")
      @client.industries(1)
    end
  end

  describe '#shareholders' do
    it 'build the correct url for fetching shareholders' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/shareholders?api_key=test")
      @client.shareholders(1)
    end
  end

  describe '#bank_accounts' do
    it 'build the correct url for fetching bank_accounts' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/bank-accounts?api_key=test")
      @client.bank_accounts(1)
    end
  end

  describe '#accounts' do
    it 'build the correct url for fetching accounts' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/accounts?api_key=test")
      @client.accounts(1)
    end
  end

  describe '#accounts_details' do
    it 'build the correct url for fetching accounts_details' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/accounts/1?api_key=test")
      @client.accounts_details(1, 1)
    end
  end

  describe '#documents' do
    it 'build the correct url for fetching documents' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/documents?api_key=test")
      @client.documents(1)
    end
  end

  describe '#subsidiaries' do
    it 'build the correct url for fetching subsidiaries' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/subsidiaries?api_key=test")
      @client.subsidiaries(1)
    end
  end

  describe '#parent' do
    it 'build the correct url for fetching parent' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/parent?api_key=test")
      @client.parent(1)
    end
  end

  describe '#directors' do
    it 'build the correct url for fetching directors' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/directors?api_key=test")
      @client.directors(1)
    end
  end

  describe '#directorships' do
    it 'build the correct url for fetching directorships' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/directorships?api_key=test")
      @client.directorships(1)
    end
  end

  describe '#mortages' do
    it 'build the correct url for fetching mortages' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/mortages?api_key=test")
      @client.mortages(1)
    end
  end

  describe '#service_addresses' do
    it 'build the correct url for fetching service_addresses' do
      allow(@http).to receive(:get_response).with(@base_url, "/v/sandbox/uk/companies/1/service-addresses?api_key=test")
      @client.service_addresses(1)
    end
  end

end
