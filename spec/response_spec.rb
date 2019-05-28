# frozen_string_literal: true

require_relative '../lib/response'
require_relative 'spec_helper'

describe Response do
  describe '#json' do
    subject { Response.new('{ "foo": "bar" }') }

    it 'holds the JSON string response' do
      expect(subject.json.class).must_equal String
    end
  end
end
