require 'spec_helper'
require 'json'
require 'duedil/response'

describe Duedil::Response do
  before do
    @http_response = double

    @response = Duedil::Response.new(@http_response)
  end

  it 'delegates missing methods to the http response object' do
    allow(@http_response).to receive(:code).and_return('200')

    expect(@response.code).to be_eql '200'
  end

  describe 'ok query method' do
    it 'returns true if the status code is 200' do
      allow(@http_response).to receive(:code).and_return('200')

      expect(@response.ok?).to be_eql true
    end

    it 'returns false otherwise' do
      allow(@http_response).to receive(:code).and_return('400')

      expect(@response.ok?).to be_eql false
    end
  end

  describe 'json query method' do
    it 'returns true if the response has a json content type' do
      allow(@http_response).to receive(:[]).with('Content-Type').and_return('application/json;charset=utf-8')

      expect(@response.json?).to be_eql true
    end

    it 'returns false otherwise' do
      allow(@http_response).to receive(:[]).with('Content-Type').and_return('text/html')

      expect(@response.json?).to be_eql false
    end
  end

  describe 'object method' do
    it 'decodes the response body as json and returns a struct object' do
      allow(@http_response).to receive(:body).and_return('{"response":{"foo":"bar"}}')

      expect(@response.object).to be_instance_of Duedil::Struct
    end
  end

  describe 'hash method' do
    it 'delegates hash to object' do
      allow(@http_response).to receive(:body).and_return('{"response":{"foo":"bar"}}')

      expect(@response.hash).to be_eql @response.object.hash
    end
  end

  describe 'list method' do
    context 'when the hash has data' do
      it 'should return data hash' do
        allow(@http_response).to receive(:body).and_return('{"response":{"data":[{"foo":"bar"}]}}')

        expect(@response.list).to be_eql [{"foo" => "bar"}]
      end
    end

    context 'when the hash does not have data' do
      it 'should return nil' do
        allow(@http_response).to receive(:body).and_return('{"response":{"foo":"bar"}}')

        expect(@response.list).to be_nil
      end
    end
  end
end
