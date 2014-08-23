require 'spec_helper'
require 'json'
require 'duedil/struct'

describe Duedil::Struct do
  it 'can be used as a json object class' do
    struct = JSON.parse('{}', :object_class => Duedil::Struct)
    expect(struct).to be_instance_of Duedil::Struct
  end

  it 'provides snakecase reader methods for the json object members' do
    struct = JSON.parse('{"latestAnnualReturnDate":"2012-04-20"}', :object_class => Duedil::Struct)
    expect(struct.latest_annual_return_date).to be_eql '2012-04-20'
  end

  it 'responds to snakecase reader methods for the json object members' do
    struct = JSON.parse('{"latestAnnualReturnDate":"2012-04-20"}', :object_class => Duedil::Struct)
    expect(struct.respond_to?(:latest_annual_return_date)).to be_eql true
  end
end
