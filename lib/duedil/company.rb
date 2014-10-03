module Duedil
  class Company
    include Duedil::Client

    def all(filters = {})
      path = path 'companies'
      request path, filters: filters
    end

    def get(company_id)
      path = path "companies/#{company_id}"
      request path
    end

    def registered_address(company_id, filters = {})
      path = path "companies/#{company_id}/registered-address"
      request path, filters
    end

    def previous_company_names(company_id, filters = {})
      path = path "companies/#{company_id}/previous-company-names"
      request path, filters
    end

    def industries(company_id, filters = {})
      path = path "companies/#{company_id}/industries"
      request path, filters
    end

    def shareholders(company_id, filters = {})
      path = path "companies/#{company_id}/shareholders"
      request path, filters
    end

    def bank_accounts(company_id, filters = {})
      path = path "companies/#{company_id}/bank-accounts"
      request path, filters
    end

    def accounts(company_id, filters = {})
      path = path "companies/#{company_id}/accounts"
      request path, filters
    end

    def accounts_details(company_id, account_id, filters = {})
      path = path "companies/#{company_id}/accounts/#{account_id}"
      request path, filters
    end

    def documents(company_id, filters = {})
      path = path "companies/#{company_id}/documents"
      request path, filters
    end

    def subsidiaries(company_id, filters = {})
      path = path "companies/#{company_id}/subsidiaries"
      request path, filters
    end

    def parent(company_id, filters = {})
      path = path "companies/#{company_id}/parent"
      request path, filters
    end

    def directors(company_id, filters = {})
      path = path "companies/#{company_id}/directors"
      request path, filters
    end

    def directorships(company_id, filters = {})
      path = path "companies/#{company_id}/directorships"
      request path, filters
    end

    def mortages(company_id, filters = {})
      path = path "companies/#{company_id}/mortages"
      request path, filters
    end

    def service_addresses(company_id, filters = {})
      path = path "companies/#{company_id}/service-addresses"
      request path, filters
    end

  end
end
