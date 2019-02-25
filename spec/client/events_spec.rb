require 'spec_helper'

RSpec.describe MobilizeAmerica::Client::Events do
  let(:standard_headers) { {'Content-Type' => 'application/json'} }

  subject { MobilizeAmerica::Client.new }

  describe '#organization_events' do
    let(:org_id) { 123 }
    let(:events_url) { "https://#{MobilizeAmerica::Client::API_DOMAIN}/api/v1/organizations/#{org_id}/events" }
    let(:response) { {'data' => [{'id' => 1, 'description' => 'event 1'}, {'id' => 2, 'description' => 'event 2'}]} }

    it 'should call the endpoint and return JSON' do
      stub_request(:get, events_url).with(headers: standard_headers).to_return(body: response.to_json)
      expect(subject.organization_events(organization_id: org_id)).to eq response
    end
  end
end