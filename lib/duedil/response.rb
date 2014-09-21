require 'json'
require 'duedil/struct'

module Duedil
  class Response
    def initialize(http_response)
      @http_response = http_response
    end

    def respond_to_missing?(name, include_private = false)
      @http_response.respond_to?(name)
    end

    def method_missing(name, *args, &block)
      @http_response.send(name, *args, &block)
    end

    def ok?
      code.to_i == 200
    end

    def hash
      object.hash
    end

    def json?
      self['Content-Type'].split(';').first == 'application/json'
    end

    def object
      @object ||= JSON.parse(body, :object_class => Struct).response
    end
  end
end
