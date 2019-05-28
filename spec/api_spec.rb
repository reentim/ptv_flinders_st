# frozen_string_literal: true

require_relative '../lib/api'
require_relative 'spec_helper'

describe Api do
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
end
