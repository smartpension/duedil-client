# Duedil::Client

The duedil client provides a simple Ruby interface to the Duedil API.

## Installation

Add this line to your application's Gemfile:

    gem 'duedil-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install duedil-client

## Usage

### Configuration

In order to instantiate the endpoint, a configuration hash is required. This hash must have keys:
- version
- base_url
- api_key
- locale
- sandbox

### Company Enpoint

```
company = Duedil::Company.new config
```

Available methods:
```
company.all
company.get(company_id)
company.registered_address(company_id)
company.previous_company_names(company_id)
company.industries(company_id)
company.shareholders(company_id)
company.bank_accounts(company_id)
company.accounts(company_id)
company.accounts_details(company_id)
company.documents(company_id)
company.subsidiaries(company_id)
company.parent(company_id)
company.directors(company_id)
company.directorships(company_id)
company.mortages(company_id)
company.service_addresses(company_id)
```

All the method have an optional argument for filtering (see duedil documentation for more details)

### Director Enpoint

```
director = Duedil::Director.new config
```

Available methods:
```
director.all
director.get(director_id)
director.companies(director_id)
director.directorships(director_id)
director.service_addresses(director_id)
```

All the method have an optional argument for filtering (see duedil documentation for more details)

## Contributing

1. Fork it ( http://github.com/smartpension/duedil/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
