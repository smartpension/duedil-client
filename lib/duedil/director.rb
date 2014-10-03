module Duedil
  class Director
    include Duedil::Client

    def all(filters = {})
      path = path 'directors'
      request path, filters: filters
    end

    def get(director_id)
      path = path "directors/#{director_id}"
      request path
    end

    def companies(director_id, filters = {})
      path = path "directors/#{director_id}/companies"
      request path, filters
    end

    def directorships(director_id, filters = {})
      path = path "directors/#{director_id}/directorships"
      request path, filters
    end

    def service_addresses(director_id, filters = {})
      path = path "directors/#{director_id}/service-addresses"
      request path, filters
    end

  end
end
