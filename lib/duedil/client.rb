require 'net/http'
require 'cgi'

require "duedil/version"
require 'duedil/response'

module Duedil
  class Client
    attr_accessor :api_key, :version, :base_url, :sandbox, :locale

    def initialize(options = {})
      @api_key  = options.delete(:api_key)
      @version  = options.delete(:version)
      @base_url = options.delete(:base_url)
      @sandbox  = options.delete(:sandbox) || true
      @locale   = options.delete(:locale) || 'uk'
      @http     = options.delete(:http) || Net::HTTP
    end

    def company(company_id)
      path = path "companies/#{company_id}"
      get path
    end

    def companies(filters = {})
      path = path 'companies'
      get path, filters: filters
    end

    private

    def base_path
      @base_path ||= begin
        path = "/#{version}"
        path += "/sandbox" if sandbox
        path += "/#{locale}"
        path
      end
    end

    def path(endpoint)
      "#{base_path}/#{endpoint}"
    end

    def get(path, params = {})
      request_uri = request_uri(path, params.merge(:api_key => api_key))
      response = @http.get_response(base_url, request_uri)
      Response.new(response)
    end

    def request_uri(path, hash = {})
      query_params = hash.map do |key, value|
        if value.is_a? Hash
          "#{escape(key)}=#{escape(value.to_json)}"
        else
          "#{escape(key)}=#{escape(value)}"
        end
      end

      path + '?' + query_params.flatten.join('&')
    end

    def escape(value)
      CGI.escape value.to_s
    end

  end
end
