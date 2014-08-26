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

    def registered_address(company_id)
      path = path "companies/#{company_id}/registered-address"
      request path
    end

    def previous_company_names(company_id)
      path = path "companies/#{company_id}/previous-company-names"
      request path
    end

    def industries(company_id)
      path = path "companies/#{company_id}/industries"
      request path
    end

    def shareholders(company_id)
      path = path "companies/#{company_id}/shareholders"
      request path
    end

    def bank_accounts(company_id)
      path = path "companies/#{company_id}/bank-accounts"
      request path
    end

    def accounts(company_id)
      path = path "companies/#{company_id}/accounts"
      request path
    end

    def accounts_details(company_id, account_id)
      path = path "companies/#{company_id}/accounts/#{account_id}"
      request path
    end

    def documents(company_id)
      path = path "companies/#{company_id}/documents"
      request path
    end

    def subsidiaries(company_id)
      path = path "companies/#{company_id}/subsidiaries"
      request path
    end

    def parent(company_id)
      path = path "companies/#{company_id}/parent"
      request path
    end

    def directors(company_id)
      path = path "companies/#{company_id}/directors"
      request path
    end

    def directorships(company_id)
      path = path "companies/#{company_id}/directorships"
      request path
    end

    def mortages(company_id)
      path = path "companies/#{company_id}/mortages"
      request path
    end

    def service_addresses(company_id)
      path = path "companies/#{company_id}/service-addresses"
      request path
    end

  end
end
