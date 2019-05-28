# frozen_string_literal: true

require_relative '../lib/api'
require_relative 'spec_helper'

describe Api do
  let(:api) { Api.new(device_id, secret_key) }
  let(:device_id) { DEVICE_ID }
  let(:secret_key) { SECRET_KEY }

  describe '#url' do
    let(:device_id) { '1234' }
    let(:secret_key) { 'f3a34bc9-1ff0-4235-b501-32a41e07c2ce' }

    it 'produces a signed url' do
      url = api.url('/v3/departures/route_type/3/stop/1071')

      expect(url).must_equal 'http://timetableapi.ptv.vic.gov.au/v3/departures'\
                             '/route_type/3/stop/1071?devid=1234&signature=2B6'\
                             '05AD19EAC2D2EF3B8FE683E5BDD1043D32CD6'
    end
  end

  describe '#get' do
    it 'returns a response object' do
      VCR.use_cassette('/v3/departures/route_type/3/stop/1071') do
        response = api.get('/v3/departures/route_type/3/stop/1071')

        expect(response.class).must_equal Response
      end
    end
  end
end
